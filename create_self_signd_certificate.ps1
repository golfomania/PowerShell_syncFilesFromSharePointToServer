$FilePath = 'your_path_where_the_certificates_will_be_stored'
$StoreLocation = 'CurrentUser' # be aware that LocalMachine requires elevated privileges
$expirationYears = 1

$tenant_id = 'your_tenant_id'

$SubjectName = $tenant_id + '_certificate'
$cert_password = 'enter_a_password_here'
 
$pfxFileName = $SubjectName + '.pfx'
$cerFileName = $SubjectName + '.cer'
 
$PfxFilePath = $FilePath + $pfxFileName
$CerFilePath = $FilePath + $cerFileName
 
$CertBeginDate = Get-Date
$CertExpiryDate = $CertBeginDate.AddYears($expirationYears)

$SecStringPw= ConvertTo-SecureString -String $cert_password -Force -AsPlainText

$Cert = New-selfSignedCertificate -DnsName $SubjectName -CertStoreLocation "cert:\$StoreLocation\My" -NotBefore $CertBeginDate -NotAfter $CertExpiryDate -KeySpec Signature

Export-PfxCertificate -cert $Cert -FilePath $PFXFilePath -Password $SecStringPw
Export-Certificate -cert $Cert -FilePath $CerFilePath
