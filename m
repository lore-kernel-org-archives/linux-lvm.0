From: Jean Aumont <JeanAumont@videotron.ca>
Message-id: <3F3054EB.3000909@videotron.ca>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_plH3c/3UFhs3wrWiiEexDg)"
Subject: [linux-lvm] lvcreate -- couldn't read physical volume "/dev/md3" (on raid 5)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Aug  6 09:10:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

--Boundary_(ID_plH3c/3UFhs3wrWiiEexDg)
Content-type: multipart/alternative;
 boundary="Boundary_(ID_W0M6sZ7ytQOmKWQbZXl7Aw)"


--Boundary_(ID_W0M6sZ7ytQOmKWQbZXl7Aw)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

Hi everyone,

I tried to create a logical volume specifying the "VolumegroupName" and 
the "PhysicalVolumepath" as follow and it failled.

[root@Mamouth proc]# lvcreate  --size 4g -n LogVol00_test -r 1024  
Volume00 /dev/md3
lvcreate -- couldn't read physical volume "/dev/md3"

I repeated the same command without the "PhysicalVolumePath" and it 
worked fine.

[root@Mamouth proc]# lvcreate  --size 4g -n LogVol00_test -r 1024  Volume00
lvcreate -- doing automatic backup of "Volume00"
lvcreate -- logical volume "/dev/Volume00/LogVol00_test" successfully 
created

Can someone explain this to me. "/dev/md3" is a raid 5.

Thanks,

Jean Aumont

PS. You can find in attachment the same command in "Debug mode"
       It also does not work !!!


--Boundary_(ID_W0M6sZ7ytQOmKWQbZXl7Aw)
Content-type: text/html; charset=us-ascii
Content-transfer-encoding: 7BIT

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
Hi everyone,<br>
<br>
I tried to create a logical volume specifying the "VolumegroupName" and
the "PhysicalVolumepath" as follow and it failled.<br>
<br>
<b>[root@Mamouth proc]# lvcreate&nbsp; --size 4g -n LogVol00_test -r 1024&nbsp;
Volume00 /dev/md3<br>
lvcreate -- couldn't read physical volume "/dev/md3"</b><br>
<br>
I repeated the same command without the "PhysicalVolumePath" and it
worked fine.<br>
<br>
<b>[root@Mamouth proc]# lvcreate&nbsp; --size 4g -n LogVol00_test -r 1024&nbsp;
Volume00<br>
lvcreate -- doing automatic backup of "Volume00"<br>
lvcreate -- logical volume "/dev/Volume00/LogVol00_test" successfully
created</b><br>
<br>
Can someone explain this to me. "/dev/md3" is a raid 5.<br>
<br>
Thanks,<br>
<br>
Jean Aumont<br>
<br>
PS. You can find in attachment the same command in "Debug mode"<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It also does not work !!!<br>
<br>
</body>
</html>

--Boundary_(ID_W0M6sZ7ytQOmKWQbZXl7Aw)--

--Boundary_(ID_plH3c/3UFhs3wrWiiEexDg)
Content-type: application/x-zip-compressed; name=lvmcreateDebug.zip
Content-transfer-encoding: base64
Content-disposition: inline; filename=lvmcreateDebug.zip

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
a+lhUOuTP82aa7OBphl7qeXDYBisGYNlB4HeSQ+Jyg4CNeyvbO9OQ/ZSSYe7cFcz7srOBZUf
eJOeC2rWXNmuoWa8pZINa2GtZqyVHRMqPwInOSbUrLPS7UrNGEshGb7CV834Kj019M5qSY/f
9c3/LiPdJtWQr+TJ8BW+asZX6SGibztdma+SQ0TN+irdntWMrxSS4St81Yyv0jNF7/tSXyVn
ipr1VbotrBlfKSTDV/iqGV+lR4z2I4pKR4ya9VW6Ha0ZXykkw1f4qhlfZSeO3r2V+Wpz4qhZ
b21tg2vGX4oJ8Rgea8ZjKgeQKh0/WusvaSXnjyrlKK65zva/4gyFxzUVD1U62ao4dBO5LrPi
sM8kQn3PV72DGiuDlCdTXuc6Zfy/QTh3fSdw/9yqQD6uqoljJxy4nj9YOvPA9WY7aXdqCnxn
6NoTpQHpBasucvf+9/t/C9cbhhOFKeUrsDbjJ97w6//PvLPMZQ1cZgeNlp/JtgpZZgez7dz3
OJQ1PypqYdrRZLtdfEzecrwD7xROtIvzjtz5YGhHETvVrS9rj0ZFQ5Jk6Z1n+3Mqm2j0zk7C
9YdfNsC356EbRsZyRrnBm4VCYsPofXfoDMIn3xHDiIgzkgyaOPYyPrx5Ncu24uXzfXp/9+G3
+/LiCm4Hla3Lj797965+uy3abbLdbdptst0d2m2u3Y+jr8+73S3tdv/+7/97ht1+5vfuU2v3
M793n1q7n/m9+8Ta7dJtk93m1m203dy6jbabW7fJdo/ptsluc+s22m5u3Ubbza3bZLsdum2y
29y6jbabW7fRdnPrpt3H0O5ffv1dp+XxP5z7zP843NHu+XP8e07c8Gf+iXmCDUfi3+G+YqHz
79H1Z75APNGuP/OFy4l2vUvXv0PXe3TdfNe5res2XbPh3NENN5ybueGGcx833PA+DTfb8Csa
brbh1zTc/NLwhqY30PTCx63yIe1Y4pUPoMUdiotfj0iis2fGRAIueSgrvuhm3B7gjz+tg/5b
/Ovj5kHSzXNndZ5v2++i6gNupXH55rRK51UxVumB2+qZFFSgFFdnVsVjcwDzwy77TSnG0laM
dX6KsTQVUx13ZIppayumfX6KaWsqpjruyBTT0VZM5/wU09FUTHWcEcW0ZILZxLuB8F59fRX9
8I2IRnlDO4yVNHWm3vypGd0ljznq6C6KPDfdpSXX1p0s7qjuVOmjmpqSObv1UFazjmhOaEWU
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

--Boundary_(ID_plH3c/3UFhs3wrWiiEexDg)--
