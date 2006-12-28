In-Reply-To: <4218702.1167293532536.JavaMail.mailer@post.ch>
Subject: RE: [linux-lvm] Mirror between different SAN fabrics
Message-ID: <OF96D12158.513C59F5-ONC1257252.002F043B-C1257252.00307A01@schering.de>
From: Christian.Rohrmeier@SCHERING.DE
Date: Thu, 28 Dec 2006 09:49:28 +0100
MIME-Version: 1.0
Content-type: multipart/mixed; 
	Boundary="0__=4EBBF8C1DFBC82AB8f9e8a93df938690918c4EBBF8C1DFBC82AB"
Content-Disposition: inline
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm-bounces@redhat.com

--0__=4EBBF8C1DFBC82AB8f9e8a93df938690918c4EBBF8C1DFBC82AB
Content-type: text/plain; charset=US-ASCII

Hi,

Here is a nice example from one of my RHEL 4 Oracle servers:

We have three layers:

first the LUNs from the SAN are multipathed to device aliases:

[root@ ~]# multipath -ll
sanb (XXXX60e8003f653000000XXXX000001c7)
[size=101 GB][features="1 queue_if_no_path"][hwhandler="0"]
\_ round-robin 0 [active]
 \_ 0:0:1:1 sdb 8:16 [active][ready]
 \_ 1:0:1:1 sdd 8:48 [active][ready]

sana (XXXX60e80039cbe000000XXXX000006ad)
[size=101 GB][features="1 queue_if_no_path"][hwhandler="0"]
\_ round-robin 0 [active]
 \_ 0:0:0:1 sda 8:0  [active][ready]
 \_ 1:0:0:1 sdc 8:32 [active][ready]

Next these multipath aliases are RAIDed:

[root@ ~]# mdadm --detail /dev/md0
/dev/md0:
        Version : 00.90.01
  Creation Time : Thu Nov  2 13:07:01 2006
     Raid Level : raid1
     Array Size : 106788160 (101.84 GiB 109.35 GB)
    Device Size : 106788160 (101.84 GiB 109.35 GB)
   Raid Devices : 2
  Total Devices : 2
Preferred Minor : 0
    Persistence : Superblock is persistent

    Update Time : Thu Dec 28 09:36:19 2006
          State : clean
 Active Devices : 2
Working Devices : 2
 Failed Devices : 0
  Spare Devices : 0


    Number   Major   Minor   RaidDevice State
       0     253        2        0      active sync   /dev/mapper/sana
       1     253        3        1      active sync   /dev/mapper/sanb
           UUID : b5ac4ae9:99da8114:744a7ebb:aba6f687
         Events : 0.4254576

And finally, the RAID device is used with LVM:

[root@ ~]# vgs -o +devices
  VG   #PV #LV #SN Attr   VSize   VFree Devices
  vg00   2   2   0 wz--n-  31.78G    0  /dev/cciss/c0d0p2(0)
  vg00   2   2   0 wz--n-  31.78G    0  /dev/cciss/c0d0p4(0)
  vg00   2   2   0 wz--n-  31.78G    0  /dev/cciss/c0d0p2(250)
  vg01   1   5   0 wz--n- 101.84G    0  /dev/md0(0)
  vg01   1   5   0 wz--n- 101.84G    0  /dev/md0(5120)
  vg01   1   5   0 wz--n- 101.84G    0  /dev/md0(5376)
  vg01   1   5   0 wz--n- 101.84G    0  /dev/md0(5632)
  vg01   1   5   0 wz--n- 101.84G    0  /dev/md0(8192)

This works very well, as both paths and mirrors are able to break away
without any disruption in disk access.

Cheers,

Christian


                                                                           
             <mathias.herzog@p                                             
             ostfinance.ch>                                                
             Sent by:                                                   To 
             linux-lvm-bounces         <linux-lvm@redhat.com>              
             @redhat.com                                                cc 
                                                                           
                                                                   Subject 
             28.12.2006 09:12          RE: [linux-lvm] Mirror between      
                                       different SAN fabrics               
                                                                           
             Please respond to                                             
                LVM general                                                
              discussion and                                               
                development                                                
             <linux-lvm@redhat                                             
                   .com>                                                   
                                                                           
                                                                           





> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Matt P
[...]
> I think the proper way would be to use mdadm. Setup software
> RAID1 prior to getting LVM involved...
That sounds like a good solution. So far I don't know mdadm but I'm
already getting into it

Thanks, Mathias

Sicherheitshinweis:
Dieses E-Mail von PostFinance ist signiert. Weitere Informationen finden
Sie unter:
https://www.postfinance.ch/e-signature.
Geben Sie Ihre Sicherheitselemente niemals Dritten bekannt.(See attached
file: smime.p7s)_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--0__=4EBBF8C1DFBC82AB8f9e8a93df938690918c4EBBF8C1DFBC82AB
Content-type: application/pkcs7; 
	name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-transfer-encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIINszCCA6cw
ggMQoAMCAQICEG+vuGdzb316NcV1yvWubhowDQYJKoZIhvcNAQEFBQAwbjEpMCcGA1UEChMgRGV1
dHNjaGVyIFNwYXJrYXNzZW4gVmVybGFnIEdtYkgxHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5l
dHdvcmsxIDAeBgNVBAMTF1MtVHJ1c3QsIERFLCBDbGFzcyAyIENBMB4XDTA1MTEyMjAwMDAwMFoX
DTE1MTEyMTIzNTk1OVowggEFMQswCQYDVQQGEwJDSDENMAsGA1UECBMEQmVybjENMAsGA1UEBxME
QmVybjEgMB4GA1UEChMXRGllIFNjaHdlaXplcmlzY2hlIFBvc3QxHzAdBgNVBAsTFlZlcmlTaWdu
IFRydXN0IE5ldHdvcmsxOTA3BgNVBAsTMFRlcm1zIG9mIHVzZSBhdCBodHRwczovL3d3dy5zLXRy
dXN0LmRlL3JwYSAoYykwNTEwMC4GA1UECxMnQ2xhc3MgMiBPblNpdGUgSW5kaXZpZHVhbCBTdWJz
Y3JpYmVyIENBMSgwJgYDVQQDEx9EaWUgU2Nod2VpemVyaXNjaGUgUG9zdCBNYWlsIENBMIGfMA0G
CSqGSIb3DQEBAQUAA4GNADCBiQKBgQDsULs5KMIpCW4QrE3xKMO0FKxooh6XbkEL8QqW/rWLKoqc
NyAQxdWpYB6RjWupKklPPrkMJNT5IwgbfeF9InLAGTUHX5ZMuynsvfIxB739ArYWErbDvEoP7+oe
P1AxLd63YgGz6W6hS46Rg1pmXwJ1ISdhABSifM4jmIDkLq75awIDAQABo4GsMIGpMBIGA1UdEwEB
/wQIMAYBAf8CAQAwQgYDVR0gBDswOTA3BgtghkgBhvhFAQcXAjAoMCYGCCsGAQUFBwIBFhpodHRw
czovL3d3dy5zLXRydXN0LmRlL3JwYTAOBgNVHQ8BAf8EBAMCAQYwIAYDVR0RBBkwF6QVMBMxETAP
BgNVBAMTCEMxQzItMS01MB0GA1UdDgQWBBRIOwWhs7CcfqGatK/Ext+WyKs4KzANBgkqhkiG9w0B
AQUFAAOBgQB2nxmJWiIUOlwTlhqQpCVNelrBMnMR5RA9DQJQpt9bfM2qpbLVo3n+wziO63iRjGAR
LSlbQh2Q+nbeVwilQ7u4nh8+kwT2VcXElO61hNqU+6MTCWQob5rXu1LJjvcejD3OQwHEVmkr9bH9
rqo7E/NFYFNiF0tssg9rDgaDH4PjXDCCAwIwggJrAhAfQihfPIgPjjyJs4Szqx8cMA0GCSqGSIb3
DQEBBQUAMIHBMQswCQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xPDA6BgNVBAsT
M0NsYXNzIDIgUHVibGljIFByaW1hcnkgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgLSBHMjE6MDgG
A1UECxMxKGMpIDE5OTggVmVyaVNpZ24sIEluYy4gLSBGb3IgYXV0aG9yaXplZCB1c2Ugb25seTEf
MB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazAeFw05ODA1MTgwMDAwMDBaFw0xODA1MTgy
MzU5NTlaMIHBMQswCQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xPDA6BgNVBAsT
M0NsYXNzIDIgUHVibGljIFByaW1hcnkgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgLSBHMjE6MDgG
A1UECxMxKGMpIDE5OTggVmVyaVNpZ24sIEluYy4gLSBGb3IgYXV0aG9yaXplZCB1c2Ugb25seTEf
MB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkC
gYEAp4gBIXQs5xoD8JjhlzwPIQjxnNuX6Zr8wgQGE75fUsjMHiwSViy4AWkszJkfrbCWrnkE8hM5
wXuYuggs6MKEEyyqaekJ9MepAqRCwiNPStjwDqL7MWzJ5m+ZJwf15vRMeJ5t60aG+rmGyVTyssSv
1EYcWskVMP8NbPUtDm3Of3cCAwEAATANBgkqhkiG9w0BAQUFAAOBgQARRaikf/HjcyDKve7f9Ycj
kT2NrEdFGt5t21Qhzg6DDvjc5UPV6y5hkSPicgA0VffEzxEz3cHkIiNcUFMZ+GTn9wkPRVGgVyvf
vCJm/jFweyU6D8WKfsO7cgHM8L1NUoGkG1hYU9VTOvUOatrpr8ThWPNCb1RiR6wxlNENzu8dMTCC
BCgwggORoAMCAQICEFOzgj3/z/gxFoM0KNJ2u24wDQYJKoZIhvcNAQEEBQAwggEFMQswCQYDVQQG
EwJDSDENMAsGA1UECBMEQmVybjENMAsGA1UEBxMEQmVybjEgMB4GA1UEChMXRGllIFNjaHdlaXpl
cmlzY2hlIFBvc3QxHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOTA3BgNVBAsTMFRl
cm1zIG9mIHVzZSBhdCBodHRwczovL3d3dy5zLXRydXN0LmRlL3JwYSAoYykwNTEwMC4GA1UECxMn
Q2xhc3MgMiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSgwJgYDVQQDEx9EaWUgU2No
d2VpemVyaXNjaGUgUG9zdCBNYWlsIENBMB4XDTA2MDQwNDAwMDAwMFoXDTA3MDQwNDIzNTk1OVow
gbgxIDAeBgNVBAoUF0RpZSBTY2h3ZWl6ZXJpc2NoZSBQb3N0MRowGAYDVQQLFBFNYWlsIENlcnRp
ZmljYXRlczExMC8GA1UECxMoVGVybXMgb2YgdXNlIGF0IHd3dy5zLXRydXN0LmRlL3JwYSAoYykw
MTEXMBUGA1UEAxMOTWF0aGlhcyBIZXJ6b2cxLDAqBgkqhkiG9w0BCQEWHW1hdGhpYXMuaGVyem9n
QHBvc3RmaW5hbmNlLmNoMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxwCsm0o4w2arhohH7
QuB/KfdOGgX2SYmlHMcwLCbh/MfmuQg78zdaaF4zE366h4p7tOuGhGNLGqJT8bOc1K86edvtQ2yN
6QsuFNfSsHFa152hlgzoALNyZRqhGdOrQzvcAuuodVGZCVQyYX3GLwzLXXE7qfmLplNPmjNDtKUg
SwIDAQABo4HiMIHfMAkGA1UdEwQCMAAwQQYDVR0gBDowODA2BgpghkgBhvhFAQcnMCgwJgYIKwYB
BQUHAgEWGmh0dHBzOi8vd3d3LnMtdHJ1c3QuZGUvcnBhMAsGA1UdDwQEAwIFoDARBglghkgBhvhC
AQEEBAMCB4AwXAYDVR0fBFUwUzBRoE+gTYZLaHR0cDovL29uc2l0ZWNybC5zLXRydXN0LmRlL0Rp
ZVNjaHdlaXplcmlzY2hlUG9zdE1haWxDZXJ0aWZpY2F0ZXMvTGF0ZXN0Q1JMMBEGCmCGSAGG+EUB
BgkEAwEB/zANBgkqhkiG9w0BAQQFAAOBgQBCjd2C7oLyYc7paVjRl4AJuSH7n01VIgGNXCQ2mN4J
B6Y5zYfqHB+zmhmqDun/fhcdfKwD4R15Q/tdSPpd6CLGzGff0A0nD18mBL1XlIc0XRLavNdFR5bc
ZMP+VtSlYBUa+YBenF/thPECCdk5M/EAzazqdXIxvGjTdhgudCl/eDCCAtIwggI7oAMCAQICEEHl
U7TbxXw+tOS7l1GkNQUwDQYJKoZIhvcNAQEFBQAwgcExCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5W
ZXJpU2lnbiwgSW5jLjE8MDoGA1UECxMzQ2xhc3MgMiBQdWJsaWMgUHJpbWFyeSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eSAtIEcyMTowOAYDVQQLEzEoYykgMTk5OCBWZXJpU2lnbiwgSW5jLiAtIEZv
ciBhdXRob3JpemVkIHVzZSBvbmx5MR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMB4X
DTAxMDYxMjAwMDAwMFoXDTE2MDYxMTIzNTk1OVowbjEpMCcGA1UEChMgRGV1dHNjaGVyIFNwYXJr
YXNzZW4gVmVybGFnIEdtYkgxHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxIDAeBgNV
BAMTF1MtVHJ1c3QsIERFLCBDbGFzcyAyIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDn
A5RxqZgSd7R6nw6D9qd1h2whdYj6biACg/BGyHqI+1FMLGMJh1En2nfzSBTqwJIdVa2+6YiMDQHz
8LbWCIYv3oABiLXBG8FG6rlY6nVwdkz0EXKyTtClaGDhVU36o77ApCmhNPnpmGbPZvsL9kRA1A7L
Tvc0OW+iVWTAcaetKQIDAQABox0wGzAMBgNVHRMEBTADAQH/MAsGA1UdDwQEAwIBBjANBgkqhkiG
9w0BAQUFAAOBgQBAX0VqvODgoRR3ryXnpi2G5yO7KrANMHHl6GXT+WpeY7QEsmjyJWT4RUAhLc9u
xMIqt5p4EmsgjrfRNdnPQt8tnWpGIR3ZpT/A7zOUs4j9H4W2n7gyow2Gzf3gF8vJkMGE+5kBOYFW
31uXgMsURqt2xMNVFJZ0n+fuc8kHKKlTRzGCA44wggOKAgEBMIIBGzCCAQUxCzAJBgNVBAYTAkNI
MQ0wCwYDVQQIEwRCZXJuMQ0wCwYDVQQHEwRCZXJuMSAwHgYDVQQKExdEaWUgU2Nod2VpemVyaXNj
aGUgUG9zdDEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazE5MDcGA1UECxMwVGVybXMg
b2YgdXNlIGF0IGh0dHBzOi8vd3d3LnMtdHJ1c3QuZGUvcnBhIChjKTA1MTAwLgYDVQQLEydDbGFz
cyAyIE9uU2l0ZSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0ExKDAmBgNVBAMTH0RpZSBTY2h3ZWl6
ZXJpc2NoZSBQb3N0IE1haWwgQ0ECEFOzgj3/z/gxFoM0KNJ2u24wCQYFKw4DAhoFAKCCAccwGAYJ
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDYxMjI4MDgxMjEyWjAjBgkq
hkiG9w0BCQQxFgQUNwz7w7Mz2EQGFw5LXJ9IP7owFlAwNAYJKoZIhvcNAQkPMScwJTAKBggqhkiG
9w0DBzAOBggqhkiG9w0DAgICAIAwBwYFKw4DAgcwggEwBgsqhkiG9w0BCRACCzGCAR8wggEbMIIB
BTELMAkGA1UEBhMCQ0gxDTALBgNVBAgTBEJlcm4xDTALBgNVBAcTBEJlcm4xIDAeBgNVBAoTF0Rp
ZSBTY2h3ZWl6ZXJpc2NoZSBQb3N0MR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTkw
NwYDVQQLEzBUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cucy10cnVzdC5kZS9ycGEgKGMpMDUx
MDAuBgNVBAsTJ0NsYXNzIDIgT25TaXRlIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQTEoMCYGA1UE
AxMfRGllIFNjaHdlaXplcmlzY2hlIFBvc3QgTWFpbCBDQQIQU7OCPf/P+DEWgzQo0na7bjANBgkq
hkiG9w0BAQEFAASBgJNt+1UZTWG4P2NYlhIC3wJ1LndCgEK0PTovCVgXUlimrIYgAiDZBBEBpFhx
x+Ye/ae3uhlvqamg8VfQ19hrbtr+gtX6FZaXv5YrJ4DTjTOXWtTKG0MIV0lUoQ+FTkdGrpFmOMbG
7e18tRMxs4AzSCAARNkrPqPr3VvLQl4nA4daAAAAAAAA

--0__=4EBBF8C1DFBC82AB8f9e8a93df938690918c4EBBF8C1DFBC82AB--
