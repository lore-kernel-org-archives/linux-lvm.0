Message-ID: <38945D85.256215BF@alwan.com>
Date: Sun, 30 Jan 2000 09:49:25 -0600
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My 
 first time)
References: <200001301356.OAA06686@u9etz.ez-darmstadt.telekom.de>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms0DE82D07B08C710C37AA19DF"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------ms0DE82D07B08C710C37AA19DF
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Heinz Mauelshagen wrote:

> > Heinz Mauelshagen wrote:
> >
> > > > Heinz Mauelshagen wrote:
> > > >
> > > > > Please have a look at the BUGS file on the <ftp://linux.msede.com/lvm/v0.8>
> > > > > as well. The fixes in there should help.
> > > >
> > > > Thanks.  I just found that right before this email.
> > >
> > > Good.
> > >
> > > >
> > > > Not that this is a big problem but maybe a little bug:
> > > >
> > > > $ vgdisplay -A
> > > > Segmentation fault (core dumped)
> >
> > $  /sbin/vgdisplay -dA
> > lvm_check_kernel_lvmtab_consistency -- CALLED
> > vg_check_active_all_vg -- CALLED
> > vg_status_get_count -- CALLED
> > vg_status_get_count -- LEAVING with ret: 0  and  count: 1
> > vg_status_get_namelist -- CALLED
> > vg_status_get_namelist -- LEAVING
> > vg_check_active_all_vg -- LEAVING
> > lvm_tab_vg_check_exist_all_vg -- CALLED
> > lvm_tab_read -- CALLED
> > lvm_tab_read -- LEAVING with ret: 0  data: 804B740  size: 8
> > lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
> > lvm_check_kernel_lvmtab_consistency -- LEAVING with ret: 1
> > lvm_get_iop_version -- CALLED
> > lvm_get_iop_version -- AFTER ioctl ret: 0
> > lvm_get_iop_version -- LEAVING with ret: 0
> > vg_check_active_all_vg -- CALLED
> > vg_status_get_count -- CALLED
> > vg_status_get_count -- LEAVING with ret: 0  and  count: 1
> > vg_status_get_namelist -- CALLED
> > vg_status_get_namelist -- LEAVING
> > vg_check_active_all_vg -- LEAVING
> > vg_check_name -- CALLED
> > vg_check_name -- vg_name: "main_vg"
> > lvm_check_chars -- CALLED
> > lvm_check_chars -- LEAVING
> > vg_check_name -- LEAVING with ret: 0
> > lvm_tab_vg_check_exist -- CALLED with vg_name: "main_vg"
> > vg_check_name -- CALLED
> > vg_check_name -- vg_name: "main_vg"
> > lvm_check_chars -- CALLED
> > lvm_check_chars -- LEAVING
> > vg_check_name -- LEAVING with ret: 0
> > lvm_tab_read -- CALLED
> > Segmentation fault
> >
>
> <SNIP>
>
> Would you please be so kind as to change "free ( data);" to
>
>    if ( data != NULL) {
>       free ( data);
>       data = NULL;
>    }

Only found one of these in lvm_tab_vg_check_exist.c

But it cores in the lvm_tab_read.c function at the else if

around line 70 (not sure because of my debug code)

The below code is the problem.

         else if ( ( buffer = malloc ( stat_b.st_size)) == NULL) {
           ret =  -LVM_ELVM_TAB_READ_MALLOC;

I placed debug statements in it to see this.

Note that stat_b.st_size = 8

I hope this helps.  I do not know enough (yet) about the code to know what buffer is
and why it is setup this way.

>
>
> and recompile/retry.
>
> Heinz
> --
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Systemmanagement CS-TS                           T-Nova
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@EZ-Darmstadt.Telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

--------------ms0DE82D07B08C710C37AA19DF
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIJ8gYJKoZIhvcNAQcCoIIJ4zCCCd8CAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
B+owggS0MIIEHaADAgECAhBtaAr33EWpnFUtfXtMoojcMA0GCSqGSIb3DQEBBAUAMIHMMRcw
FQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29y
azFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5
IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRp
dmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMB4XDTk5MDIwNjAwMDAw
MFoXDTAwMDIwNjIzNTk1OVowggEQMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UE
CxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9y
ZXBvc2l0b3J5L1JQQSBJbmNvcnAuIGJ5IFJlZi4sTElBQi5MVEQoYyk5ODEeMBwGA1UECxMV
UGVyc29uYSBOb3QgVmFsaWRhdGVkMTMwMQYDVQQLEypEaWdpdGFsIElEIENsYXNzIDEgLSBO
ZXRzY2FwZSBGdWxsIFNlcnZpY2UxFzAVBgNVBAMUDkNocmlzIEFuZGVyc29uMR4wHAYJKoZI
hvcNAQkBFg9jaHJpc0BhbHdhbi5jb20wXDANBgkqhkiG9w0BAQEFAANLADBIAkEAwcx0X9Qo
J8OVKX1LTdNsaIlHnUBk/hc+OZ3NINyQpJu3Wqc8rs0y5rci49hx4ri6e1mX7aR+oa0KpSuw
WpXjIwIDAQABo4IBkjCCAY4wCQYDVR0TBAIwADCBrwYDVR0gBIGnMIAwgAYLYIZIAYb4RQEH
AQEwgDAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL0NQUzBiBggrBgEF
BQcCAjBWMBUWDlZlcmlTaWduLCBJbmMuMAMCAQEaPVZlcmlTaWduJ3MgQ1BTIGluY29ycC4g
YnkgcmVmZXJlbmNlIGxpYWIuIGx0ZC4gKGMpOTcgVmVyaVNpZ24AAAAAAAAwEQYJYIZIAYb4
QgEBBAQDAgeAMIGGBgpghkgBhvhFAQYDBHgWdmQ0NjUyYmQ2M2YyMDQ3MDI5Mjk4NzYzYzlk
MmYyNzUwNjljNzM1OWJlZDFiMDU5ZGE3NWJjNGJjOTcwMTc0N2RhNWQzZjIxNDFiZWFkYjJi
ZDJlODkyMTBhZDZiZjdkNzExNDg5Y2ExYjI0NGZhZjNlYTQ1MGMwMwYDVR0fBCwwKjAooCag
JIYiaHR0cDovL2NybC52ZXJpc2lnbi5jb20vY2xhc3MxLmNybDANBgkqhkiG9w0BAQQFAAOB
gQBCRY8YtczgpvVSl1NQYedWLlDvsdhHah3qYQQ02DjB6KJF13/CcjrLZcUaXYyYkvH7BB8L
kU7ueovQVcS5J0zsrLCDwe/LQAVXYFh71ZQ3LZ1kv3bkMMxs5YLaoy1GG7g9X6w41CQgR2M7
gkzTTQAEc68lq9Ks3BOc7usMdMc4uTCCAy4wggKXoAMCAQICEQDSdi6NFAw9fbKoJV2v7g11
MA0GCSqGSIb3DQEBAgUAMF8xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5j
LjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJsaWMgUHJpbWFyeSBDZXJ0aWZpY2F0aW9uIEF1dGhv
cml0eTAeFw05ODA1MTIwMDAwMDBaFw0wODA1MTIyMzU5NTlaMIHMMRcwFQYDVQQKEw5WZXJp
U2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9
d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5IFJlZi4sTElBQi5M
VEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRpdmlkdWFsIFN1YnNj
cmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKB
gQC7WkSKBBa7Vf0DeootlE8VeDa4DUqyb5xUv7zodyqdufBou5XZMUFweoFLuUgTVi3HCOGE
QqvAopKrRFyqQvCCDgLpL/vCO7u+yScKXbawNkIztW5UiE+HSr8Z2vkV6A+HthzjzMaajn9q
JJLj/OBluqexfu/J2zdqyErICQbkmQIDAQABo3wwejARBglghkgBhvhCAQEEBAMCAQYwRwYD
VR0gBEAwPjA8BgtghkgBhvhFAQcBATAtMCsGCCsGAQUFBwIBFh93d3cudmVyaXNpZ24uY29t
L3JlcG9zaXRvcnkvUlBBMA8GA1UdEwQIMAYBAf8CAQAwCwYDVR0PBAQDAgEGMA0GCSqGSIb3
DQEBAgUAA4GBAIi4Nzvd2pQ3AK2qn+GBAXEekmptL/bxndPKZDjcG5gMB4ZbhRVqD7lJhaSV
8Rd9Z7R/LSzdmkKewz60jqrlCwbe8lYq+jPHvhnXU0zDvcjjF7WkSUJj7MKmFw9dWBpJPJBc
VaNlIAD9GCDlX4KmsaiSxVhqwY0DPOvDzQWikK5uMYIB0DCCAcwCAQEwgeEwgcwxFzAVBgNV
BAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYw
RAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVm
LixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1
YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQCEG1oCvfcRamcVS19e0yiiNww
CQYFKw4DAhoFAKCBhjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0wMDAxMzAxNTQ5MjdaMCMGCSqGSIb3DQEJBDEWBBQfe2kybFuDmUZXbyRakUlzODBshTAn
BgkqhkiG9w0BCQ8xGjAYMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BEBAw04dbw9tSg88DgqAjRFoBhNmKbZJ176W+huH1FHoF2/LdMZz7kEACEtihS4PBXP3m7/h
OBJReuoLxZ2Ffz3c
--------------ms0DE82D07B08C710C37AA19DF--
