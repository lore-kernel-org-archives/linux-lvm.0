Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BKAt42026794
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 16:10:59 -0400
Received: from smtp3.marviq.com (smtp3.marviq.com [80.248.35.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6BJp4ji021732
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 15:51:04 -0400
Received: from owa.xb.nl (unknown [10.0.56.10])
	by smtp3.marviq.com (Postfix) with ESMTP id AFB199422A
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 21:51:03 +0200 (CEST)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C6A523.6591B888"
Subject: RE: [linux-lvm] Copying LVM from one system to another
Date: Tue, 11 Jul 2006 21:50:34 +0200
Message-ID: <32F72C4D4D0EC8458CA5BFD76A6D6C68064E9D47@gimli.xb.local>
References: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF3C0B@gimli.xb.local>
	<44B3F826.7010100@conterra.de>
From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6A523.6591B888
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Dieter,
=20
I will try this idea out and post the results to the list.=20
=20
Many thanks
=20
Shaun


In your case, I would suggest to create an independent volume group on =
the other
disk with a different VG-name. The LVs may have the same names on both =
VGs.
If you put them into different hosts, you may synchronize/backup them =
via network.
Else you may put both VGs into the same hosts without problems, mounting =
the LVs manually
and copy the data directly.

Don't worry about any config-files to save. You may connect any LVM disk =
to any IDE
port and it should be recognized automatically.

If you move an VG from one host to an other, you should do an "vgexport" =
first.
I don't know if this is still necessary with LVM2. I accidentally moved =
VGs back
and forth even without using lvexport and did not found a problem.

Dieter.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/





Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden =
is op http://www.xb.nl/disclaimer.html




------_=_NextPart_001_01C6A523.6591B888
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhwTAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEANwAAAFJFOiBbbGludXgtbHZtXSBD
b3B5aW5nIExWTSBmcm9tIG9uZSBzeXN0ZW0gdG8gYW5vdGhlcgBsEwEFgAMADgAAANYHBwALABUA
MgAiAAIAWgEBIIADAA4AAADWBwcACwAVADMAGwACAFQBAQmAAQAhAAAARUE2NTc4RUNBNkE4OTc0
RDkyMjVDQTg5NzI4RjhDMDYATwcBA5AGAAQPAAA4AAAAAwA2AAAAAABAADkAxAMvRiOlxgEeAD0A
AQAAAAUAAABSRTogAAAAAAIBRwABAAAAKgAAAGM9VVM7YT0gO3A9WEI7bD1HSU1MSS0wNjA3MTEx
OTUxMjdaLTExMjI1AAAAHgBJAAEAAAA3AAAAUmU6IFtsaW51eC1sdm1dIENvcHlpbmcgTFZNIGZy
b20gb25lIHN5c3RlbSB0byBhbm90aGVyAABAAE4AANcw+R2lxgEeAFoAAQAAAB0AAABsaW51eC1s
dm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAAIBWwABAAAAVwAAAAAAAACBKx+kvqMQGZ1uAN0BD1QC
AAAAAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AU01UUABsaW51eC1sdm0tYm91bmNlc0By
ZWRoYXQuY29tAAACAVwAAQAAACIAAABTTVRQOkxJTlVYLUxWTS1CT1VOQ0VTQFJFREhBVC5DT00A
AAAeAF0AAQAAAA4AAABEaWV0ZXIgU3T8a2VuAAAAAgFeAAEAAAA/AAAAAAAAAIErH6S+oxAZnW4A
3QEPVAIAAAAARGlldGVyIFN0/GtlbgBTTVRQAHN0dWVrZW5AY29udGVycmEuZGUAAAIBXwABAAAA
GQAAAFNNVFA6U1RVRUtFTkBDT05URVJSQS5ERQAAAAAeAGYAAQAAAAUAAABTTVRQAAAAAB4AZwAB
AAAAHQAAAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAAAHgBoAAEAAAAFAAAAU01UUAAA
AAAeAGkAAQAAABQAAABzdHVla2VuQGNvbnRlcnJhLmRlAB4AcAABAAAAMwAAAFtsaW51eC1sdm1d
IENvcHlpbmcgTFZNIGZyb20gb25lIHN5c3RlbSB0byBhbm90aGVyAAACAXEAAQAAABsAAAABxqUe
hPZ/2aOI2jdFfJ1YSBvPMPFDAAEwRSQAHgB0AAEAAAAnAAAATFZNIGdlbmVyYWwgZGlzY3Vzc2lv
biBhbmQgZGV2ZWxvcG1lbnQAAB4AGgwBAAAAEAAAAFNoYXVuIE1jY3VsbGFnaAAeAB0OAQAAADMA
AABbbGludXgtbHZtXSBDb3B5aW5nIExWTSBmcm9tIG9uZSBzeXN0ZW0gdG8gYW5vdGhlcgAAAgEJ
EAEAAAB1BwAAcQcAAAQYAABMWkZ1tnXG/QMACgByY3BnMTI1gjIDQ2h0bWwxAzA/AQMB9wqAAqQD
4wIAY2jBCsBzZXQwIAcTAoD/EAMAUARWCFUHshHVDlEDAd0Q1zIGAAbDEdUzBEYQ2fkS72Y0A8YR
hRHjCO8J9/Y7Gh8OMDUbPxsREeEMYM5jAFALCQFkMzYRYAul5DQgEAIqXA6yAZAOEAA5IDxIVE1M
IBBkaXI9ILByPn3PIHMAIQMwIcFkbwDgIcH5CrFccRoAIcEQ8AMwIiUbEWAgKzMgACEgRUFEEyHw
ICw3NyEQVElUHExFJh0f8A7wUmU6CCBbbAuAdXgtbEh2bV0XEXB5C4BnoCBMVk0gA1IgAiCAZSBz
eXN0ZSrAiHRvIABwb3RoBJDpJi04NSEQLydfIMIK4y4gLd8u7w4QNg7wPE1wRVRBIAWgAjAJ8HQM
PSIF4CEzNi4wMBguMjkzEw4gIiBuAmEHgD1HRU5FUvBBVE9SJh0ooS1QJd8XKHEwHyDBNRFgPEJP
HERZJh0fcTd/Zzk2ASEQRElWIGlkPTE70E9XQSjQC1B5VABleHQ0ODM5OP8hfyKAAAAjJSPDI4Ek
HzmfPzqvO7A9Tz5fP2ogSTY0H0NKP58gpDzgIRBGT05+VCqAANA0IAcTMeEZsT1OIzMQSlIrEGl6
NCAy90M7GDADMGMT8AOyAdA/eTBIaSBECJArUHIs9SAsNTthL0jiIfkiB0WLvwHAIgcKolA4CoAg
LDAlof4vO5FPj0d/QO9B/0MPRB//UG9GP1WPSF9JZkrPS9RMjS9OH08vVV8ghTggACZumGJzcAKA
IhgnYQFA/1r/UW9Sf1OPVJ9kn1a/V8//WN9Z72dPXA9sb14vXz9gT2lMq0kgA/BsAyAh0HlNK4Bo
BAA7wWVhKtB1wwVAAHBkIHBvK0B5sfMrABygc3UgsAQgK5F7MvspICtALmIfYy9QL2gvaT//ak9r
X3QPbX9uj2+fcK9xv/9yz3PfdO91/3cPYS98333v/5A/ZW9mf39PgF+Bb4J/kn//hJ+Fr4a/h8+I
34nviv+bX++NH44vjz+it00AcHmiAHD8a3OQ35Hvfu+W75f/mQ//mh+iz5w/nU+eX59voH+hj/+i
n6OvpL+lz4/vqJ+pr7v//5QvlT+rD6wfrS+uP74/sF//sW+yf7OPtJ+1r7a/xx+435e577r/znZT
EQB1bryP/72fqp/Cn8OvxL/Fz85/2Y9/2p/HT8hfyW/Kf8uP3j8x/w4gOLE0wSIYCrEKgdYPzV//
42/PfdEfAfG7r+QqO2HlHNUpIWXmKkkDoHkIYTHg2mERMCx5AghgbHrAe5D8Z2cHkHsRK6AFAHow
K1B/K7E7wHqwPGAJ8AEAAjAganYG8HUHgCAJwAhgcH8q0XsjK+Psn+2v7rzhEHP+a3khK/ArsOEB
ASAEkPLC2FZHLTPyfKBUe0EqUG8EIADAeaARAHYrAHsyc380ATPjBCDz0Qbg+AH48HP+LvSf9a/u
vSKA78F60HpxXyvxKsALgCuR+FhoevFz7/BQ/3L6AisgbhDwDoAUMGnqkC9iSUBr86H/83bPBzAz
4BFA8JBya/w//U/57q1FbPAwAZf/svu2ADTv+pcBM/fTemJwDoAZ8AAQ9wFxFhDToHQqEnsy+cQp
QP9JsDyABG8Ff+68eqIZkCnwnXsjZPHQ+DIcoGN0PIC/BF8N/+6tEa8Sv+68RPuA/id6gAQReZEf
MHpk+iAx8fBmaWctGTALAHvT+tD7+mB8oFkBtTHxKvARUBizjypS95Mrk/ogSURFFK//Fb/uvHrg
18B6k/fwKxAKce3wwWJ7UjHwZwKSesDTkP8rkPoAC6DwEAzBEZ8d3xO/7yLvI//+jwfRb/ph8hH4
8P9JIAJwK3D7gAnEHCT0NAGEpSCVZCrTInbxIHgf0vsz0BkwcnyBJc8m3+69LDHhF8Jrbm93O8Dl
wHnE/3nwewB5QhsR+1AJkHmR9+PdG6EyfKB5EElAY3oR+MD/DLIpI3rACMIC4i2/Ls8PH3dJIB/h
+BBl+mD7kApGdfvqcAvBbPpgLON6k/hQesD/MUB6gDjw06AhwQq2La82v/8k3zz/Pg8W602zPM9A
3z7v90NvRH/mKl9JT0pfSypGT8dHX+68L7F1eC06gAOA//oAeUA6Q3xxTD9NT05fT2S6QPigZNOA
fJAQMG1Qn2dRr0Vvv4s8Qfow+KBmBD0iwNB0cHM6L9Qvd1ngLlQ4L0/SDHG+L3xiC7A48FtBT1Ui
0Xx3QuAg0ObiZiDQC7B7AHsASFlQRVJMSU6eSyyQWW9af1uOfX3rgQcg0C1w51BcY2YxXP97oOvp
Xx9gL1uN3T9XoWcf5VeuOeThL0HlMFTfVe8f7rzxsXrAC/QbwEhPV/gtVE/4IHqAV99Y6mRRkRFg
ZHAuBCBnL26x9W7wLxuhLXHkXH9dj16a/3EvcjpiP2NOdc9yOWhfaC//aT9qT2tfbG99f9RvfM/W
j1/Xn9iv3H98/+bpNc/hL5BCT0RZfx0yN4hhUEhUTUzlMH2NMAAAAB4ANRABAAAAOgAAADwzMkY3
MkM0RDREMEVDODQ1OENBNUJGRDc2QTZENkM2ODA2NEU5RDQ3QGdpbWxpLnhiLmxvY2FsPgAAAB4A
ORABAAAAWQAAADwzMkY3MkM0RDREMEVDODQ1OENBNUJGRDc2QTZENkM2ODBBQ0YzQzBCQGdpbWxp
LnhiLmxvY2FsPiA8NDRCM0Y4MjYuNzAxMDEwMEBjb250ZXJyYS5kZT4AAAAAHgBHEAEAAAAPAAAA
bWVzc2FnZS9yZmM4MjIAAAsA8hABAAAAHwDzEAEAAAB6AAAAUgBFACUAMwBBACAAWwBsAGkAbgB1
AHgALQBsAHYAbQBdACAAQwBvAHAAeQBpAG4AZwAgAEwAVgBNACAAZgByAG8AbQAgAG8AbgBlACAA
cwB5AHMAdABlAG0AIAB0AG8AIABhAG4AbwB0AGgAZQByAC4ARQBNAEwAAAAAAAsA9hAAAAAAQAAH
MHAZBEYjpcYBQAAIMOrJw2UjpcYBAwDeP69vAAADAPE/CQgAAB4A+D8BAAAAEAAAAFNoYXVuIE1j
Y3VsbGFnaAACAfk/AQAAAFcAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089WEIvT1U9
RklSU1QgQURNSU5JU1RSQVRJVkUgR1JPVVAvQ049UkVDSVBJRU5UUy9DTj1TSEFVTgAAHgD6PwEA
AAAVAAAAU3lzdGVtIEFkbWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAAAAAAANynQMjAQhAatLkI
ACsv4YIBAAAAAAAAAC4AAAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAADAB1AAAAAAAMAHkAAAAAA
HgAwQAEAAAAGAAAAU0hBVU4AAAAeADFAAQAAAAYAAABTSEFVTgAAAB4AMkABAAAAHQAAAGxpbnV4
LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAAAHgAzQAEAAAAUAAAAc3R1ZWtlbkBjb250ZXJyYS5k
ZQAeADhAAQAAAAYAAABTSEFVTgAAAB4AOUABAAAAAgAAAC4AAAADAHZA/////wsAKQAAAAAACwAj
AAAAAAADAAYQdTVRkgMABxASAwAAAwAQEAAAAAADABEQAAAAAB4ACBABAAAAZQAAAEhJRElFVEVS
LElXSUxMVFJZVEhJU0lERUFPVVRBTkRQT1NUVEhFUkVTVUxUU1RPVEhFTElTVE1BTllUSEFOS1NT
SEFVTklOWU9VUkNBU0UsSVdPVUxEU1VHR0VTVFRPQ1JFQVQAAAAAAgF/AAEAAAA6AAAAPDMyRjcy
QzRENEQwRUM4NDU4Q0E1QkZENzZBNkQ2QzY4MDY0RTlENDdAZ2ltbGkueGIubG9jYWw+AAAAvdg=

------_=_NextPart_001_01C6A523.6591B888--
