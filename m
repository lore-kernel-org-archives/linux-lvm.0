Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m56EJ35G004372
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 10:19:04 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m56EIHFU017690
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 10:18:18 -0400
Received: by fg-out-1718.google.com with SMTP id e21so819682fga.7
	for <linux-lvm@redhat.com>; Fri, 06 Jun 2008 07:18:17 -0700 (PDT)
Message-ID: <1c748a490806060718t55680d38mdaa1286b754c346@mail.gmail.com>
Date: Fri, 6 Jun 2008 07:18:16 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Performance tunning on LVM2
In-Reply-To: <OF71017368.B3FFEE57-ONC1257460.0047F98A-C1257460.004C061F@lippi.fr>
MIME-Version: 1.0
Content-Type: multipart/related; 
	boundary="----=_Part_6209_12502263.1212761896632"
References: <OF71017368.B3FFEE57-ONC1257460.0047F98A-C1257460.004C061F@lippi.fr>
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

------=_Part_6209_12502263.1212761896632
Content-Type: multipart/alternative; 
	boundary="----=_Part_6210_17482743.1212761896633"

------=_Part_6210_17482743.1212761896633
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This looks like the result of excessive seeking. Are origin volume and
snapshot both on the same physical drive? Is it possible to make a volume
group out of two drives, and arrange things so that origin volume and
snapshot are hitting different disks?

Larry Dickson
Cutting Edge Networked Storage

On 6/6/08, Antony MARTINEAU <Antony.MARTINEAU@lippi.fr> wrote:
>
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
>
> *Speed on /dev/vg0/test when there is NO snapshot :*
>
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
>
> *Speed on /dev/vg0/test when there is one snapshot of this original volume
> :*
>
> suse2:~ # lvremove --force /dev/vg0/test3.snap
>   Logical volume "test3.snap" successfully removed
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test
>   Logical volume "test.snap" created
> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> 400+0 records in
> 400+0 records out
> 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s
>
>
> *Speed on /dev/vg0/test when there is 2 snapshots of this original volume
> :*
>
> suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test
>   Logical volume "test1.snap" created
> suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test
>   Logical volume "test2.snap" created
> suse2:~ # lvremove /dev/vg0/test2.snap
> Do you really want to remove active logical volume "test2.snap"? [y/n]: y
>   Logical volume "test2.snap" successfully removed
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
> (2.6.24.2)
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

------=_Part_6210_17482743.1212761896633
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>This looks like the result of excessive seeking. Are origin volume and snapshot both on the same physical drive? Is it possible to make a volume group out of two drives, and arrange things so that origin volume and snapshot are hitting different disks?</div>

<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 6/6/08, <b class="gmail_sendername">Antony MARTINEAU</b> &lt;<a href="mailto:Antony.MARTINEAU@lippi.fr">Antony.MARTINEAU@lippi.fr</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br><font face="sans-serif" size="2">Hello,</font> <br><font face="sans-serif" size="2">My configuration:</font> <br>
<font face="sans-serif" size="2">Server DELL 2860 Intel(R) Xeon(R) CPU &nbsp;X3230 @ 2.66GHz (Quad Core)</font> <br><font face="sans-serif" size="2">8GB of &nbsp;memory</font> <br><font face="sans-serif" size="2">2 x SAS 15000 300G0 RAID 0 hardware </font><br>
<font face="sans-serif" size="2">SLES 10 SP2</font> <br><font face="sans-serif" size="2">Kernel 2.6.16.60-0.21-xen</font> <br><br><font face="sans-serif" size="2">i have one volume group vg0 ( whith one PV, the two disks in raid0) whith many lvm</font> <br>
<font face="sans-serif" size="2">I am very surprise about LVM2 performance when a snapshot is done.</font> <br><font face="sans-serif" size="2">Write speed on the Original volume is very bad when a snaphot is active...</font> <br>
<br><font face="sans-serif" size="2">For exemple:</font> <br><br><font face="sans-serif" size="2"><b>Speed on /dev/vg0/test when there is NO snapshot :</b></font> <br><br><font face="sans-serif" size="2">suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font> <br>
<font face="sans-serif" size="2">400+0 records in</font> <br><font face="sans-serif" size="2">400+0 records out</font> <br><font face="sans-serif" size="2">838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s</font> <br>
<br><font face="sans-serif" size="2"><b>Speed on /dev/vg0/test when there is one snapshot of this original volume :</b></font> <br><br><font face="sans-serif" size="2">suse2:~ # lvremove --force /dev/vg0/test3.snap</font> <br>
<font face="sans-serif" size="2">&nbsp; Logical volume &quot;test3.snap&quot; successfully removed</font> <br><font face="sans-serif" size="2">suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font> <br><font face="sans-serif" size="2">400+0 records in</font> <br>
<font face="sans-serif" size="2">400+0 records out</font> <br><font face="sans-serif" size="2">838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s</font> <br><font face="sans-serif" size="2">suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test</font> <br>
<font face="sans-serif" size="2">&nbsp; Logical volume &quot;test.snap&quot; created</font> <br><font face="sans-serif" size="2">suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font> <br><font face="sans-serif" size="2">400+0 records in</font> <br>
<font face="sans-serif" size="2">400+0 records out</font> <br><font face="sans-serif" size="2">838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s</font> <br><br><br><font face="sans-serif" size="2"><b>Speed on /dev/vg0/test when there is 2 snapshots of this original volume :</b></font> <br>
<br><font face="sans-serif" size="2">suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test</font> <br><font face="sans-serif" size="2">&nbsp; Logical volume &quot;test1.snap&quot; created</font> <br><font face="sans-serif" size="2">suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test</font> <br>
<font face="sans-serif" size="2">&nbsp; Logical volume &quot;test2.snap&quot; created</font> <br><font face="sans-serif" size="2">suse2:~ # lvremove /dev/vg0/test2.snap</font> <br><font face="sans-serif" size="2">Do you really want to remove active logical volume &quot;test2.snap&quot;? [y/n]: y</font> <br>
<font face="sans-serif" size="2">&nbsp; Logical volume &quot;test2.snap&quot; successfully removed</font> <br><font face="sans-serif" size="2">suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400</font> <br><font face="sans-serif" size="2">400+0 records in</font> <br>
<font face="sans-serif" size="2">400+0 records out</font> <br><font face="sans-serif" size="2">838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s</font> <br><br><br><font face="sans-serif" size="2">Do you know &nbsp;some elements about tunning performance?,?</font> <br>
<br><font face="sans-serif" size="2">Performances are </font><font size="3">disastrous when a snaphot is active</font> <br><font face="sans-serif" size="2">Could you give your speed result? and your amelioration??</font> <br>
<br><font face="sans-serif" size="2">ps:Results are the same whithout Kernel Xen and whith a kernel more recent (<a onclick="return top.js.OpenExtLink(window,event,this)" href="http://2.6.24.2/" target="_blank">2.6.24.2</a>)<br>
</font>
<table>
<tbody>
<tr>
<td><font face="Arial" size="2">Cordialement,<br></font></td></tr></tbody></table><br>
<table>
<tbody>
<tr>
<td colspan="2">
<div align="center"><img src="cid:_1_0AC6134C0AC60F78004C0616C1257460"></div>
<tr>
<td><font face="Arial" size="3"><b>MARTINEAU<br>Antony</b> </font><font face="Arial" color="#808080" size="2"><br>Service informatique </font><font face="Arial" color="#808080" size="1"><br>Assistant informatique <br>LIPPI Management </font>
<td><font face="Arial" color="#004080" size="1">La Fouillouse<br>16440 Mouthiers sur Boheme <br>Tel.: 05.45.67.34.35<br>Courriel: </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:antony.martineau@lippi.fr" target="_blank"><font face="Arial" color="blue" size="1"><u>antony.martineau@lippi.fr</u></font></a><font face="Arial" color="blue" size="1"><u><br>
</u></font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/" target="_blank"><font face="Arial" color="blue" size="1"><u>http://www.lippi.fr</u></font></a><font face="Arial" color="#004080" size="1"> </font></td>
</td></tr></td></tr></tbody></table><br><font face="sans-serif" size="3"><br><br><br></font><br><font face="Lucida Sans" size="3"><br></font><img><font face="Lucida Sans" size="3"><br></font><font face="Lucida Sans" size="2"><br>
<br>Ce message et toutes les pieces jointes sont etablis a l&#39;attention exclusive de ses destinataires et sont strictement confidentiels. </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/disclaimer.php" target="_blank"><font face="Lucida Sans" color="blue" size="2"><u>Pour en savoir plus cliquer ici</u></font></a><font face="Lucida Sans" size="2"><br>
<br>This message and any attachments are confidential to the ordinary user of the e-mail address to which it was addressed and may also be privileged. </font><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.lippi.fr/disclaimer.php" target="_blank"><font face="Lucida Sans" color="blue" size="2"><u>More information</u></font></a><font face="Lucida Sans" size="3"><br>
</font><br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_6210_17482743.1212761896633--

------=_Part_6209_12502263.1212761896632
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <_1_0AC6134C0AC60F78004C0616C1257460>
X-Attachment-Id: 0.0.1

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
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=
------=_Part_6209_12502263.1212761896632--
