Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m56F49LS015113
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 11:04:09 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m56F3q9w005057
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 11:03:53 -0400
Received: by fg-out-1718.google.com with SMTP id e21so831789fga.7
	for <linux-lvm@redhat.com>; Fri, 06 Jun 2008 08:03:52 -0700 (PDT)
Message-ID: <1c748a490806060803v1b2b7027ib6e5cdd70029a628@mail.gmail.com>
Date: Fri, 6 Jun 2008 08:03:51 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Performance tunning on LVM2
In-Reply-To: <OFFF54BB34.40906B94-ONC1257460.004F3651-C1257460.004FF3D1@lippi.fr>
MIME-Version: 1.0
Content-Type: multipart/related; 
	boundary="----=_Part_6374_22920047.1212764631859"
References: <OF71017368.B3FFEE57-ONC1257460.0047F98A-C1257460.004C061F@lippi.fr>
	<1c748a490806060718t55680d38mdaa1286b754c346@mail.gmail.com>
	<OFFF54BB34.40906B94-ONC1257460.004F3651-C1257460.004FF3D1@lippi.fr>
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

------=_Part_6374_22920047.1212764631859
Content-Type: multipart/alternative; 
	boundary="----=_Part_6375_11805802.1212764631859"

------=_Part_6375_11805802.1212764631859
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

A (linear) volume group made of two physical volumes consists of one PV
followed by the other, rather like a "Raid-Linear". If you size the
origin logical volume right, you can get one LV (the origin) to fall on one
disk, and force the snapshot to land on the other disk. This eliminates
back-and-forth seeking to the COW. Whether it solves your problem will
depend on how smart the driver is about the read-before-write activity on
the origin volume.

Other members of the list may have more experience on this. Comments?

Larry

On 6/6/08, Antony MARTINEAU <Antony.MARTINEAU@lippi.fr> wrote:
>
>
> The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)
> I have only this raid on the server
>
> But i don't understand, imagine i make a volume group  ou of this raid0. It
> is no possible to snapshot the original volume, am i wrong?
>
> If i make a new VG on another disks, For exemple /dev/vg1/
> LVM don't permit to store a snaphot on a different VG than the origin
> volum.
>
> for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap
>
> LV test and LV test.snap must be on the same volume, am i wrong ???? so it
> is impossible to store snapshot on another disk....
>
>
>   Cordialement,
>
>    *MARTINEAU
> Antony*
> Service informatique
> Assistant informatique
> LIPPI Management La Fouillouse
> 16440 Mouthiers sur Boheme
> Tel.: 05.45.67.34.35
> Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
> **http://www.lippi.fr* <http://www.lippi.fr/>
>
>
>
>   De : "Larry Dickson" <ldickson@cuttedge.com> Pour : "LVM general
> discussion and development" <linux-lvm@redhat.com> Date: 06/06/2008 16:19 Objet
> : Re: [linux-lvm] Performance tunning on LVM2
> ------------------------------
>
>
>
> This looks like the result of excessive seeking. Are origin volume and
> snapshot both on the same physical drive? Is it possible to make a volume
> group out of two drives, and arrange things so that origin volume and
> snapshot are hitting different disks?
>
> Larry Dickson
> Cutting Edge Networked Storage
>
> On 6/6/08, *Antony MARTINEAU* <*Antony.MARTINEAU@lippi.fr*<Antony.MARTINEAU@lippi.fr>>
> wrote:
>
> Hello,
> My configuration:
> Server DELL 2860 Intel(R) Xeon(R) CPU  X3230 @ 2.66GHz (Quad Core)
> 8GB of  memory
> 2 x SAS 15000 300G0 RAID 0 hardware
> SLES 10 SP2
> Kernel 2.6.16.60-0.21-xen
>
> i have one volume group vg0 ( whith one PV, the two disks in raid0) whith
> many lvm
> I am very surprise about LVM2 performance when a snapshot is done.
> Write speed on the Original volume is very bad when a snaphot is active...
>
> For exemple:
> *
> Speed on /dev/vg0/test when there is NO snapshot :*
>
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> *
> Speed on /dev/vg0/test when there is one snapshot of this original volume :
> *
>
> suse2:~ # lvremove --force /dev/vg0/test3.snap
>  Logical volume "test3.snap" successfully removed
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test
>  Logical volume "test.snap" created
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s
>
> *
> Speed on /dev/vg0/test when there is 2 snapshots of this original volume :
> *
>
> suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test
>  Logical volume "test1.snap" created
> suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test
>  Logical volume "test2.snap" created
> suse2:~ # lvremove /dev/vg0/test2.snap
> Do you really want to remove active logical volume "test2.snap"? [y/n]: y
>  Logical volume "test2.snap" successfully removed
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s
>
>
> Do you know  some elements about tunning performance?,?
>
> Performances are disastrous when a snaphot is active
> Could you give your speed result? and your amelioration??
>
> ps:Results are the same whithout Kernel Xen and whith a kernel more recent
> (*2.6.24.2* <http://2.6.24.2/>)  Cordialement,
>    *MARTINEAU
> Antony*
> Service informatique
> Assistant informatique
> LIPPI Management La Fouillouse
> 16440 Mouthiers sur Boheme
> Tel.: 05.45.67.34.35
> Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
> **http://www.lippi.fr* <http://www.lippi.fr/>
>
>
>
>
>
>
>
>
>
> Ce message et toutes les pieces jointes sont etablis a l'attention
> exclusive de ses destinataires et sont strictement confidentiels. *Pour en
> savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
>
> This message and any attachments are confidential to the ordinary user of
> the e-mail address to which it was addressed and may also be privileged. *More
> information* <http://www.lippi.fr/disclaimer.php>
>
>
> _______________________________________________
> linux-lvm mailing list*
> **linux-lvm@redhat.com* <linux-lvm@redhat.com>*
> **https://www.redhat.com/mailman/listinfo/linux-lvm*<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at *http://tldp.org/HOWTO/LVM-HOWTO/*<http://tldp.org/HOWTO/LVM-HOWTO/>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>
>
>
>
>
>
> Ce message et toutes les pieces jointes sont etablis a l'attention
> exclusive de ses destinataires et sont strictement confidentiels. *Pour en
> savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
>
> This message and any attachments are confidential to the ordinary user of
> the e-mail address to which it was addressed and may also be privileged. *More
> information* <http://www.lippi.fr/disclaimer.php>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_6375_11805802.1212764631859
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>A (linear) volume group made of two physical volumes&nbsp;consists of one&nbsp;PV followed by the other, rather like a &quot;Raid-Linear&quot;. If you size the origin&nbsp;logical volume right, you can get one LV (the origin) to fall on one disk, and force the snapshot to land on the other disk. This eliminates back-and-forth seeking to the COW. Whether it solves your problem will depend on how smart the driver is about the read-before-write activity on the origin volume.</div>

<div>&nbsp;</div>
<div>Other members of the list may have more experience on this. Comments?</div>
<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 6/6/08, <b class="gmail_sendername">Antony MARTINEAU</b> &lt;<a href="mailto:Antony.MARTINEAU@lippi.fr">Antony.MARTINEAU@lippi.fr</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br><font face="sans-serif" size="2">The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)</font> <br>
<font face="sans-serif" size="2">I have only this raid on the server</font> <br><br><font face="sans-serif" size="2">But i don&#39;t understand, imagine i make a volume group &nbsp;ou of this raid0. It is no possible to snapshot the original volume, am i wrong?</font> <br>
<br><font face="sans-serif" size="2">If i make a new VG on another disks, For exemple /dev/vg1/</font> <br><font face="sans-serif" size="2">LVM don&#39;t permit to store a snaphot on a different VG than the origin volum.</font> <br>
<br><font face="sans-serif" size="2">for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap</font> <br><br><font face="sans-serif" size="2">LV test and LV test.snap must be on the same volume, am i wrong ???? so it is impossible to store snapshot on another disk....</font> <br>
<span class="q"><br><font face="sans-serif" size="2"><br></font>
<table>
<tbody>
<tr>
<td><font face="Arial" size="2">Cordialement,</font> <br></td></tr></tbody></table><br>
<table>
<tbody>
<tr>
<td colspan="2">
<div align="center"><img src="cid:_1_07B3149007B310BC004FF3CCC1257460"></div>
<tr>
<td><font face="Arial" size="3"><b>MARTINEAU<br>Antony</b> </font><font face="Arial" color="#808080" size="2"><br>Service informatique </font><font face="Arial" color="#808080" size="1"><br>Assistant informatique <br>LIPPI Management </font>
<td><font face="Arial" color="#004080" size="1">La Fouillouse<br>16440 Mouthiers sur Boheme <br>Tel.: 05.45.67.34.35<br>Courriel: </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:antony.martineau@lippi.fr" target="_blank"><font face="Arial" color="blue" size="1"><u>antony.martineau@lippi.fr</u></font></a><font face="Arial" color="blue" size="1"><u><br>
</u></font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/" target="_blank"><font face="Arial" color="blue" size="1"><u>http://www.lippi.fr</u></font></a><font face="Arial" color="#004080" size="1"> </font></td>
</td></tr></td></tr></tbody></table><br><br><br><br></span>
<table width="100%">
<tbody>
<tr valign="top">
<td><font face="sans-serif" color="#5f5f5f" size="1">De :</font> 
<td><font face="sans-serif" size="1">&quot;Larry Dickson&quot; &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:ldickson@cuttedge.com" target="_blank">ldickson@cuttedge.com</a>&gt;</font> 
<tr valign="top">
<td><font face="sans-serif" color="#5f5f5f" size="1">Pour :</font> 
<td><font face="sans-serif" size="1">&quot;LVM general discussion and development&quot; &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a>&gt;</font> 
<tr valign="top">
<td><font face="sans-serif" color="#5f5f5f" size="1">Date:</font> 
<td><font face="sans-serif" size="1">06/06/2008 16:19</font> 
<tr valign="top">
<td><font face="sans-serif" color="#5f5f5f" size="1">Objet :</font> 
<td><font face="sans-serif" size="1">Re: [linux-lvm] Performance tunning on LVM2</font></td></td></tr></td></td></tr></td></td></tr></td></td></tr></tbody></table><br>
<hr noshade>

<div><span class="e" id="q_11a5e4cbd0ecd7b9_3"><br><br><br><font size="3">This looks like the result of excessive seeking. Are origin volume and snapshot both on the same physical drive? Is it possible to make a volume group out of two drives, and arrange things so that origin volume and snapshot are hitting different disks?</font> <br>
<font size="3">&nbsp;</font> <br><font size="3">Larry Dickson</font> <br><font size="3">Cutting Edge Networked Storage<br></font><br><font size="3">On 6/6/08, <b>Antony MARTINEAU</b> &lt;</font><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:Antony.MARTINEAU@lippi.fr" target="_blank"><font color="blue" size="3"><u>Antony.MARTINEAU@lippi.fr</u></font></a><font size="3">&gt; wrote: </font><br>
<font face="sans-serif" size="2"><br>Hello,</font><font size="3"> </font><font face="sans-serif" size="2"><br>My configuration:</font><font size="3"> </font><font face="sans-serif" size="2"><br>Server DELL 2860 Intel(R) Xeon(R) CPU &nbsp;X3230 @ 2.66GHz (Quad Core)</font><font size="3"> </font><font face="sans-serif" size="2"><br>
8GB of &nbsp;memory</font><font size="3"> </font><font face="sans-serif" size="2"><br>2 x SAS 15000 300G0 RAID 0 hardware <br>SLES 10 SP2</font><font size="3"> </font><font face="sans-serif" size="2"><br>Kernel 2.6.16.60-0.21-xen</font><font size="3"> <br>
</font><font face="sans-serif" size="2"><br>i have one volume group vg0 ( whith one PV, the two disks in raid0) whith many lvm</font><font size="3"> </font><font face="sans-serif" size="2"><br>I am very surprise about LVM2 performance when a snapshot is done.</font><font size="3"> </font><font face="sans-serif" size="2"><br>
Write speed on the Original volume is very bad when a snaphot is active...</font><font size="3"> <br></font><font face="sans-serif" size="2"><br>For exemple:</font><font size="3"> <br></font><font face="sans-serif" size="2"><b><br>
Speed on /dev/vg0/test when there is NO snapshot :</b></font><font size="3"> <br></font><font face="sans-serif" size="2"><br>suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font><font size="3"> </font><font face="sans-serif" size="2"><br>
400+0 records in</font><font size="3"> </font><font face="sans-serif" size="2"><br>400+0 records out</font><font size="3"> </font><font face="sans-serif" size="2"><br>838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s</font><font size="3"> <br>
</font><font face="sans-serif" size="2"><b><br>Speed on /dev/vg0/test when there is one snapshot of this original volume :</b></font><font size="3"> <br></font><font face="sans-serif" size="2"><br>suse2:~ # lvremove --force /dev/vg0/test3.snap</font><font size="3"> </font><font face="sans-serif" size="2"><br>
&nbsp;Logical volume &quot;test3.snap&quot; successfully removed</font><font size="3"> </font><font face="sans-serif" size="2"><br>suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font><font size="3"> </font><font face="sans-serif" size="2"><br>
400+0 records in</font><font size="3"> </font><font face="sans-serif" size="2"><br>400+0 records out</font><font size="3"> </font><font face="sans-serif" size="2"><br>838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s</font><font size="3"> </font><font face="sans-serif" size="2"><br>
suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test</font><font size="3"> </font><font face="sans-serif" size="2"><br>&nbsp;Logical volume &quot;test.snap&quot; created</font><font size="3"> </font><font face="sans-serif" size="2"><br>
suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font><font size="3"> </font><font face="sans-serif" size="2"><br>400+0 records in</font><font size="3"> </font><font face="sans-serif" size="2"><br>400+0 records out</font><font size="3"> </font><font face="sans-serif" size="2"><br>
838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s</font><font size="3"> <br><br></font><font face="sans-serif" size="2"><b><br>Speed on /dev/vg0/test when there is 2 snapshots of this original volume :</b></font><font size="3"> <br>
</font><font face="sans-serif" size="2"><br>suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test</font><font size="3"> </font><font face="sans-serif" size="2"><br>&nbsp;Logical volume &quot;test1.snap&quot; created</font><font size="3"> </font><font face="sans-serif" size="2"><br>
suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test</font><font size="3"> </font><font face="sans-serif" size="2"><br>&nbsp;Logical volume &quot;test2.snap&quot; created</font><font size="3"> </font><font face="sans-serif" size="2"><br>
suse2:~ # lvremove /dev/vg0/test2.snap</font><font size="3"> </font><font face="sans-serif" size="2"><br>Do you really want to remove active logical volume &quot;test2.snap&quot;? [y/n]: y</font><font size="3"> </font><font face="sans-serif" size="2"><br>
&nbsp;Logical volume &quot;test2.snap&quot; successfully removed</font><font size="3"> </font><font face="sans-serif" size="2"><br>suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font><font size="3"> </font><font face="sans-serif" size="2"><br>
400+0 records in</font><font size="3"> </font><font face="sans-serif" size="2"><br>400+0 records out</font><font size="3"> </font><font face="sans-serif" size="2"><br>838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s</font><font size="3"> <br>
<br></font><font face="sans-serif" size="2"><br>Do you know &nbsp;some elements about tunning performance?,?</font><font size="3"> <br></font><font face="sans-serif" size="2"><br>Performances are </font><font size="3">disastrous when a snaphot is active </font><font face="sans-serif" size="2"><br>
Could you give your speed result? and your amelioration??</font><font size="3"> <br></font><font face="sans-serif" size="2"><br>ps:Results are the same whithout Kernel Xen and whith a kernel more recent (</font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://2.6.24.2/" target="_blank"><font face="sans-serif" color="blue" size="2"><u>2.6.24.2</u></font></a><font face="sans-serif" size="2">)</font> 
<table>
<tbody>
<tr>
<td><font face="Arial" size="2">Cordialement,</font></td></tr></tbody></table><br>
<table>
<tbody>
<tr>
<td colspan="2">
<div align="center"><img src="cid:_1_07A1E0E807A1DD14004FF3CCC1257460"></div>
<tr>
<td><font face="Arial" size="3"><b>MARTINEAU<br>Antony</b> </font><font face="Arial" color="#808080" size="2"><br>Service informatique </font><font face="Arial" color="#808080" size="1"><br>Assistant informatique <br>LIPPI Management </font>
<td><font face="Arial" color="#004080" size="1">La Fouillouse<br>16440 Mouthiers sur Boheme <br>Tel.: 05.45.67.34.35<br>Courriel: </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:antony.martineau@lippi.fr" target="_blank"><font face="Arial" color="blue" size="1"><u>antony.martineau@lippi.fr</u></font></a><font color="blue" size="3"><u><br>
</u></font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/" target="_blank"><font face="Arial" color="blue" size="1"><u>http://www.lippi.fr</u></font></a><font face="Arial" color="#004080" size="1"> </font></td>
</td></tr></td></tr></tbody></table><br><font face="sans-serif" size="3"><br><br><br></font><font size="3"><br></font><font face="Lucida Sans" size="3"><br></font><font size="3"><br></font><font face="Lucida Sans" size="2"><br>
<br><br>Ce message et toutes les pieces jointes sont etablis a l&#39;attention exclusive de ses destinataires et sont strictement confidentiels. </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/disclaimer.php" target="_blank"><font face="Lucida Sans" color="blue" size="2"><u>Pour en savoir plus cliquer ici</u></font></a><font face="Lucida Sans" size="2"><br>
<br>This message and any attachments are confidential to the ordinary user of the e-mail address to which it was addressed and may also be privileged. </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/disclaimer.php" target="_blank"><font face="Lucida Sans" color="blue" size="2"><u>More information</u></font></a><font size="3"><br>
<br><br>_______________________________________________<br>linux-lvm mailing list</font><font color="blue" size="3"><u><br></u></font><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank"><font color="blue" size="3"><u>linux-lvm@redhat.com</u></font></a><font color="blue" size="3"><u><br>
</u></font><a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank"><font color="blue" size="3"><u>https://www.redhat.com/mailman/listinfo/linux-lvm</u></font></a><font size="3"><br>
read the LVM HOW-TO at </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank"><font color="blue" size="3"><u>http://tldp.org/HOWTO/LVM-HOWTO/</u></font></a> <br>
<tt><font size="2">_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
</font></tt><a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank"><tt><font size="2">https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size="2"><br>
read the LVM HOW-TO at </font></tt><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank"><tt><font size="2">http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a> <br>
<br><font face="sans-serif" size="3"><br><br><br></font><br><font face="Lucida Sans" size="3"><br></font><img><font face="Lucida Sans" size="3"><br></font><font face="Lucida Sans" size="2"><br><br>Ce message et toutes les pieces jointes sont etablis a l&#39;attention exclusive de ses destinataires et sont strictement confidentiels. </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/disclaimer.php" target="_blank"><font face="Lucida Sans" color="blue" size="2"><u>Pour en savoir plus cliquer ici</u></font></a><font face="Lucida Sans" size="2"><br>
<br>This message and any attachments are confidential to the ordinary user of the e-mail address to which it was addressed and may also be privileged. </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/disclaimer.php" target="_blank"><font face="Lucida Sans" color="blue" size="2"><u>More information</u></font></a><font face="Lucida Sans" size="3"><br>
</font><br></span></div><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_6375_11805802.1212764631859--

------=_Part_6374_22920047.1212764631859
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <_1_07B3149007B310BC004FF3CCC1257460>
X-Attachment-Id: 0.0.1

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
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=
------=_Part_6374_22920047.1212764631859
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <_1_07A1E0E807A1DD14004FF3CCC1257460>
X-Attachment-Id: 0.0.2

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
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=
------=_Part_6374_22920047.1212764631859--
