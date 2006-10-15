Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9FI1vfx023227
	for <linux-lvm@redhat.com>; Sun, 15 Oct 2006 14:01:57 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.191])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9FI1sLN001632
	for <linux-lvm@redhat.com>; Sun, 15 Oct 2006 14:01:54 -0400
Received: by nf-out-0910.google.com with SMTP id l36so1896374nfa
	for <linux-lvm@redhat.com>; Sun, 15 Oct 2006 11:01:48 -0700 (PDT)
Message-ID: <a6d13c780610151101m6cb30e81xf6fb1cb18335d75@mail.gmail.com>
Date: Sun, 15 Oct 2006 16:01:48 -0200
From: "Filipe Miranda" <filipe.miranda@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_41176_7798627.1160935308103"
Subject: [linux-lvm] CLVM does every node needs access to the shared storage?
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
To: Linux-lvm <linux-lvm@redhat.com>

------=_Part_41176_7798627.1160935308103
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everybody,

I'm building a GFS cluster but to get that done, first I need the
premilinary Cluster Suite setup and the the CLVM setup.
The cluster is composed of 6 machines, 3 lock servers using GULM and 3
client nodes.
Using RHEL4.3 GFS 6.1 U3 and RHCS (cluster Suite) Update 4
Only the client nodes have access to the shared storage, the lock servers
does not have access to the shared storage.
Everything was setup accordinly but after I installed the CLVM on all nodes
I keep receiving error messages when I try to create any Logical Volume over
the Volume Group.

Here are the message I receive when I try to create the LV:

[root@rac-node1 ~]# lvcreate -L4G -n lv01 vg01

  Found duplicate PV o2Xf8uUmskTL5fiVQAgY0nJ1ZJSMA9U3: using /dev/sds1 not
/dev/emcpowerb1

  Found duplicate PV 3yduFLdX3FWPWWMb9lIbtBf3JIPjYnHF: using /dev/emcpowerc1
not /dev/sdr1

  Found duplicate PV Kyha3qI6nVE4odg77UXf7igS3FenGJNn: using /dev/sdd1 not
/dev/emcpowerq1

  Found duplicate PV WS1LyhqQ8HaE2fIuSnXNd5sgTRtNzNAJ: using /dev/sdt1 not
/dev/emcpowera1

  Found duplicate PV DuBJ7dZsS3PIO7n5U6hINxPkWorZDzvx: using /dev/emcpowerd1
not /dev/sdq1

  Found duplicate PV ZECZzAtbA0e9pFbl9oL0lZg4q7fkS5x4: using /dev/sdk1 not
/dev/emcpowerj1

  Found duplicate PV bnVVmL6WhS2mesnOFUkT4fEfR0cFhybD: using /dev/emcpowerk1
not /dev/sdj1

  Found duplicate PV XyXrg2zdxxMS5jo03f9I4QYtGM3ILLGV: using /dev/sdl1 not
/dev/emcpoweri1

  Found duplicate PV SLE5v2eTD7cJlpRUDGG35xfXkRbW86i1: using /dev/emcpowerl1
not /dev/sdi1

  Found duplicate PV acGyUd2wX7FnOF94Cbt0ombp10iUWMSf: using /dev/sdm1 not
/dev/emcpowerh1

  Found duplicate PV ll8eNZ0JRh9katV0eui4BcxSc6HBggSI: using /dev/emcpowerm1
not /dev/sdh1

  Found duplicate PV ptGubq8R16LxywZ458P7ebmdG3Fq2aJo: using /dev/sdn1 not
/dev/emcpowerg1

  Found duplicate PV PLQ3uON7pYe7nY16gRmAP94WBaEydRwf: using /dev/emcpowern1
not /dev/sdg1

  Found duplicate PV PsVYTeKNy6EcqWYbJwQ4KEbPp2Q8HjWv: using /dev/sdo1 not
/dev/emcpowerf1

  Found duplicate PV hvekbzDAltJ3t23QveOMz1axfhj9Mp2j: using /dev/emcpowero1
not /dev/sdf1

  Found duplicate PV 5OhUbKbZLW5bTc3tpJeU4YlH0dTttJHF: using /dev/sdp1 not
/dev/emcpowere1

  Found duplicate PV dFtPhq6pkwFdl41NTrAguAEFB3601CTb: using /dev/emcpowerp1
not /dev/sde1

  Error locking on node lock-node1: Internal lvm error, check syslog

  Error locking on node lock-node2: Internal lvm error, check syslog

  Error locking on node lock-node3: Internal lvm error, check syslog
  Failed to activate new LV.

Here is what I get from the /var/log/messages:

Oct 13 21:20:46 lock-node1 lvm[5478]: Volume group for uuid not found:
UzvBBmBj7m53APMbye1XXztWjdIavfgX8L5rGTOB3i3KGYPazw1AVaGCmWsXZpqR

It seems that the CLVM complains about the lock servers not being able to
access the shared storage.
Is there a special configuration to make this setup possible?

The /etc/lvm/lvm.conf I used the following filter, (because the internal
discs are also using LVM)
    filter = [ "r|/dev/sda|", "a/.*/"


Should I add to this filter the volumes from the shared storage too?
Would that have any impact on the GFS setup?

Thank you,
Regards,


-- 
---
Filipe T Miranda

------=_Part_41176_7798627.1160935308103
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everybody,<br><br>I'm building a GFS cluster but to get that done, first I need the premilinary Cluster Suite setup and the the CLVM setup.<br>The cluster is composed of 6 machines, 3 lock servers using GULM and 3 client nodes.
<br>Using RHEL4.3 GFS 6.1 U3 and RHCS (cluster Suite) Update 4<br>Only the client nodes have access to the shared storage, the lock servers does not have access to the shared storage.<br>Everything was setup accordinly but after I installed the CLVM on all nodes I keep receiving error messages when I try to create any Logical Volume over the Volume Group.
<br><br>Here are the message I receive when I try to create the LV:<br><p style="color: rgb(0, 0, 0);"><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">
[root@rac-node1 ~]# lvcreate -L4G -n
lv01 vg01</span></font></p><span style="color: rgb(0, 0, 0);" class="q">

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
o2Xf8uUmskTL5fiVQAgY0nJ1ZJSMA9U3: using /dev/sds1 not /dev/emcpowerb1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
3yduFLdX3FWPWWMb9lIbtBf3JIPjYnHF: using /dev/emcpowerc1 not /dev/sdr1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
Kyha3qI6nVE4odg77UXf7igS3FenGJNn: using /dev/sdd1 not /dev/emcpowerq1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
WS1LyhqQ8HaE2fIuSnXNd5sgTRtNzNAJ: using /dev/sdt1 not /dev/emcpowera1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
DuBJ7dZsS3PIO7n5U6hINxPkWorZDzvx: using /dev/emcpowerd1 not /dev/sdq1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
ZECZzAtbA0e9pFbl9oL0lZg4q7fkS5x4: using /dev/sdk1 not /dev/emcpowerj1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
bnVVmL6WhS2mesnOFUkT4fEfR0cFhybD: using /dev/emcpowerk1 not /dev/sdj1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
XyXrg2zdxxMS5jo03f9I4QYtGM3ILLGV: using /dev/sdl1 not /dev/emcpoweri1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
SLE5v2eTD7cJlpRUDGG35xfXkRbW86i1: using /dev/emcpowerl1 not /dev/sdi1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
acGyUd2wX7FnOF94Cbt0ombp10iUWMSf: using /dev/sdm1 not /dev/emcpowerh1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
ll8eNZ0JRh9katV0eui4BcxSc6HBggSI: using /dev/emcpowerm1 not /dev/sdh1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV ptGubq8R16LxywZ458P7ebmdG3Fq2aJo:
using /dev/sdn1 not /dev/emcpowerg1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
PLQ3uON7pYe7nY16gRmAP94WBaEydRwf: using /dev/emcpowern1 not /dev/sdg1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
PsVYTeKNy6EcqWYbJwQ4KEbPp2Q8HjWv: using /dev/sdo1 not /dev/emcpowerf1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
hvekbzDAltJ3t23QveOMz1axfhj9Mp2j: using /dev/emcpowero1 not /dev/sdf1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
5OhUbKbZLW5bTc3tpJeU4YlH0dTttJHF: using /dev/sdp1 not /dev/emcpowere1</span></font></p>

<p><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Found duplicate PV
dFtPhq6pkwFdl41NTrAguAEFB3601CTb: using /dev/emcpowerp1 not /dev/sde1</span></font></p></span>

<p style="color: rgb(0, 0, 0);"><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Error locking on node lock-node1:
Internal lvm error, check syslog</span></font></p>

<p style="color: rgb(0, 0, 0);"><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Error locking on node </span></font><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">

lock-node2</span></font><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">:
Internal lvm error, check syslog</span></font></p>

<p style="color: rgb(0, 0, 0);"><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Error locking on node </span></font><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">

lock-node3</span></font><font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">:
Internal lvm error, check syslog</span></font></p><span style="color: rgb(0, 0, 0);" class="q">

<font face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana;">&nbsp; Failed to activate new LV.</span></font></span><br><br>Here is what I get from the /var/log/messages:<br><br><font style="color: rgb(0, 0, 0);" color="blue" face="Verdana" size="2">

<span style="font-size: 10pt; font-family: Verdana;">Oct 13 21:20:46 lock-node1 lvm[5478]:
Volume group for uuid not found:
UzvBBmBj7m53APMbye1XXztWjdIavfgX8L5rGTOB3i3KGYPazw1AVaGCmWsXZpqR<br><font size="4"><br>It seems that the CLVM complains about the lock servers not being able to access the shared storage.<br>Is there a special configuration to make this setup possible?
</font><br></span></font><br clear="all">The /etc/lvm/lvm.conf I used the following filter, (because the internal discs are also using LVM)<br><font color="blue" face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana; color: blue;">
&nbsp;&nbsp;&nbsp; filter = [ &quot;r|/dev/sda|&quot;, </span></font><font color="blue" face="Verdana" size="2">
<span style="font-size: 10pt; font-family: Verdana; color: blue;">&quot;a/.*/&quot; </span></font><font color="blue" face="Verdana" size="2"><span style="font-size: 10pt; font-family: Verdana; color: blue;"></span></font>
<br><br><br>Should I add to this filter the volumes from the shared storage too?<br>Would that have any impact on the GFS setup?<br><br>Thank you,<br>Regards,<br><br><br>-- <br>---<br>Filipe T Miranda<br><br>

------=_Part_41176_7798627.1160935308103--
