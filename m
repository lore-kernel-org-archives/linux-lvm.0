Message-ID: <3893A2CA.7E7BE688@alwan.com>
Date: Sat, 29 Jan 2000 20:32:42 -0600
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My 
 first time)
References: <200001300151.CAA04595@u9etz.ez-darmstadt.telekom.de>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms7DEB13DEA9D3D1D9ABA1FD47"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------ms7DEB13DEA9D3D1D9ABA1FD47
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Heinz Mauelshagen wrote:

> > Heinz Mauelshagen wrote:
> >
> > > Please have a look at the BUGS file on the <ftp://linux.msede.com/lvm/v0.8>
> > > as well. The fixes in there should help.
> >
> > Thanks.  I just found that right before this email.
>
> Good.
>
> >
> > Not that this is a big problem but maybe a little bug:
> >
> > $ vgdisplay -A
> > Segmentation fault (core dumped)

$  /sbin/vgdisplay -dA
lvm_check_kernel_lvmtab_consistency -- CALLED
vg_check_active_all_vg -- CALLED
vg_status_get_count -- CALLED
vg_status_get_count -- LEAVING with ret: 0  and  count: 1
vg_status_get_namelist -- CALLED
vg_status_get_namelist -- LEAVING
vg_check_active_all_vg -- LEAVING
lvm_tab_vg_check_exist_all_vg -- CALLED
lvm_tab_read -- CALLED
lvm_tab_read -- LEAVING with ret: 0  data: 804B740  size: 8
lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
lvm_check_kernel_lvmtab_consistency -- LEAVING with ret: 1
lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
vg_check_active_all_vg -- CALLED
vg_status_get_count -- CALLED
vg_status_get_count -- LEAVING with ret: 0  and  count: 1
vg_status_get_namelist -- CALLED
vg_status_get_namelist -- LEAVING
vg_check_active_all_vg -- LEAVING
vg_check_name -- CALLED
vg_check_name -- vg_name: "main_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lvm_tab_vg_check_exist -- CALLED with vg_name: "main_vg"
vg_check_name -- CALLED
vg_check_name -- vg_name: "main_vg"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
lvm_tab_read -- CALLED
Segmentation fault


>
>
> Could you provide the output of "vgdisplay -dA" to analyze this?
>
> >
> > I did this after I "vgcreate test_vg  /dev/hda8".   It looks like
> > "tool/lib/vg_check_active.c" has the same bug as
> > "tools/lib/lvm_tab_vg_check_exist_all_vg.c".   I think core dump are problems no?
>
> Yep ;-{(
>
> >
> > I think this project is important for the Linux people, they just do not know
> > that a Volume manager is the only way to split up drives and now that drives are
> > bigger.  Well..
> >
> > I hope to help by my input
>
> Yes, i appreciate this.
>
> > so please do not think I am not happy to have acess to
> > this software and this newgroup.
>
> Not at all.
>
> Heinz
>
> >
> > >
> > >
> > > Heinz
> > >
> > > > Started from scratch (new kernel code and lvm patch) and got it to work.
> > > > At least that part.  Now I am getting a core dump.  I will work this out
> > > > too I guess.
> > > >
> > > > I use veritas every other day in my job as a DBA and it works real nice.
> > > > I wish the install for LVM was as easy.  If this stuff does get into the
> > > > common source I hope others get it running much easier then I.  Is this
> > > > stuff ready for prime time? (Doc, programs and all)
> > > >
> > > > My current state is below:
> > > >
> > > > $ vgscan
> > > > vgscan -- reading all physical volumes (this may take a while...)
> > > > vgscan -- no volume groups found
> > > >
> > > > $ pvcreate /dev/hda8
> > > > pvcreate -- reinitializing physical volume
> > > > pvcreate -- physical volume "/dev/hda8" successfully created
> > > >
> > > > $ vgcreate main_vg /dev/hda8
> > > > Segmentation fault (core dumped)
> > > >
> > > >
> > > > > -------- Original Message --------
> > > > > Date: Sat, 29 Jan 2000 13:41:49 -0600
> > > > > Resent-Date: Sat, 29 Jan 2000 21:14:28 MEZ
> > > > > From: Chris Anderson <chris@alwan.com>
> > > > > Organization: Alwan, Inc.
> > > > > Subject: Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My
> > > > > first time)
> > > > >
> > > > > Ok this is my first try at LVM and I did not get it working.
> > > > >
> > > > > I ran the 2.2.13 patch on the linux source and it seemed to compile
> > > > > file.  I want to setup LVM as a module so I set the flag in the config
> > > > > to module.  Do all the compiles then after a reboot i run the below
> > > > > commands.  Note I did poke around in the doc and found nothing.
> > > > >
> > > > > $ depmod -a
> > > > > /lib/modules/2.2.14/block/lvm.o: unresolved symbol(s)
> > > > >
> > > > > $ modprobe lvm
> > > > > /lib/modules/2.2.14/block/lvm.o: unresolved symbol lvm_map_ptr
> > > > >
> > > > > It looks like something is wrong.  Any help please?  I hope this is a
> > > > > easy one.
> > > > >
> > > > > chris@alwan.com
> > > Content-Description: S/MIME Cryptographic Signature
> > >
> > > [Attachment, skipping...]
> > >
> > > --
> > >
> > > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > >
> > > Systemmanagement CS-TS                           T-Nova
> > >                                                  Entwicklungszentrum Darmstadt
> > > Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> > > Senior Systems Engineer                          Postfach 10 05 41
> > >                                                  64205 Darmstadt
> > > mge@EZ-Darmstadt.Telekom.de                      Germany
> > >                                                  +49 6151 886-425
> > >                                                           FAX-386
> > > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Content-Description: S/MIME Cryptographic Signature
>
> [Attachment, skipping...]
>
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

--------------ms7DEB13DEA9D3D1D9ABA1FD47
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
Fw0wMDAxMzAwMjMyNDNaMCMGCSqGSIb3DQEJBDEWBBT/42GulwzlHALkSVGZYKdGZY/rhTAn
BgkqhkiG9w0BCQ8xGjAYMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BECbbey3Kva4FyWOgGAoaamzTo2ksEZ7jqCKQMa2DqaTNIdzjGIqcV4Zz6YWppmHA8xsGXX3
xqwMqHeoWl0+xyVe
--------------ms7DEB13DEA9D3D1D9ABA1FD47--
