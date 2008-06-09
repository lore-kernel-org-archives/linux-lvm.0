In-Reply-To: <20080609094453.GA5507@redhat.com>
References: <OF71017368.B3FFEE57-ONC1257460.0047F98A-C1257460.004C061F@lippi.fr>	<1c748a490806060718t55680d38mdaa1286b754c346@mail.gmail.com>
	<OFFF54BB34.40906B94-ONC1257460.004F3651-C1257460.004FF3D1@lippi.fr>	<1c748a490806060803v1b2b7027ib6e5cdd70029a628@mail.gmail.com>
	<20080609094453.GA5507@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Performance tunning on LVM2
Message-ID: <OF8D53F89C.8A8CDA30-ONC1257463.00362B8A-C1257463.00377B47@lippi.fr>
From: Antony MARTINEAU <Antony.MARTINEAU@lippi.fr>
Date: Mon, 9 Jun 2008 12:06:19 +0200
Content-Type: multipart/related; boundary="=_related 00377B40C1257463_="
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Message en plusieurs parties au format MIME
--=_related 00377B40C1257463_=
Content-Type: multipart/alternative;
	boundary="=_alternative 00377B40C1257463_="


--=_alternative 00377B40C1257463_=
Content-Type: text/plain; charset="US-ASCII"

Thanks for your answer...
But my test show that it is, the LVM2 software the probleme...

Because even whith 3 writing test at the same time on 3 LV which are on 
the same VG and the same PV, the performance are better than one LV whith 
only one snapshot...

Look this test:

suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=10M count=150
150+0 records in
150+0 records out
1572864000 bytes (1.6 GB) copied, 27.9422 seconds, 56.3 MB/s

suse2:~ # dd if=/dev/zero of=/dev/vg0/test2 bs=10M count=150
150+0 records in
150+0 records out
1572864000 bytes (1.6 GB) copied, 33.2836 seconds, 47.3 MB/s

suse2:~ # dd if=/dev/zero of=/dev/vg0/test3 bs=10M count=150
150+0 records in
150+0 records out
1572864000 bytes (1.6 GB) copied, 33.784 seconds, 46.6 MB/s

With 3 writing test AT THE SAME TIME , the average is better that one 
writing test on one LV whith one snap

Look,

suse2:~ # lvcreate -s -L2G -ntest.snap /dev/vg0/test
  Logical volume "test.snap" created

suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=10M count=150
150+0 records in
150+0 records out
1572864000 bytes (1.6 GB) copied, 382.315 seconds, 4.1 MB/s

It is disastrous...

I think dd is a good test...


Cordialement,



MARTINEAU
Antony 
Service informatique 
Assistant informatique 
LIPPI Management 
La Fouillouse
16440 Mouthiers sur Boheme 
Tel.: 05.45.67.34.35
Courriel: antony.martineau@lippi.fr
http://www.lippi.fr 




De :
Heinz Mauelshagen <mauelshagen@redhat.com>
Pour :
LVM general discussion and development <linux-lvm@redhat.com>
Date:
09/06/2008 11:46
Objet :
Re: [linux-lvm] Performance tunning on LVM2



On Fri, Jun 06, 2008 at 08:03:51AM -0700, Larry Dickson wrote:
> A (linear) volume group made of two physical volumes consists of one PV
> followed by the other, rather like a "Raid-Linear". If you size the
> origin logical volume right, you can get one LV (the origin) to fall on 
one
> disk, and force the snapshot to land on the other disk. This eliminates
> back-and-forth seeking to the COW. Whether it solves your problem will
> depend on how smart the driver is about the read-before-write activity 
on
> the origin volume.
> 
> Other members of the list may have more experience on this. Comments?

If I read correctly, Antony just has *ONE* PV.

So no matter what, he has to add another to allow for snapshot COW
store allocation on that other PV, distinct from the one holding
the origin(s). Presumably there's no other bottleneck aside from the
disk, that'll do better.

Keep in mind, that unless you've got streaming writes, the performance
won't drop as much as in the (artificial) dd test below.

FYI: With the current snapshot implementation, multiple snapshots per 
single
     origin will throttle write performance because of write duplication
     to all per snapshot COW stores.

Heinz

> 
> Larry
> 
> On 6/6/08, Antony MARTINEAU <Antony.MARTINEAU@lippi.fr> wrote:
> >
> >
> > The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)
> > I have only this raid on the server
> >
> > But i don't understand, imagine i make a volume group  ou of this 
raid0. It
> > is no possible to snapshot the original volume, am i wrong?
> >
> > If i make a new VG on another disks, For exemple /dev/vg1/
> > LVM don't permit to store a snaphot on a different VG than the origin
> > volum.
> >
> > for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap
> >
> > LV test and LV test.snap must be on the same volume, am i wrong ???? 
so it
> > is impossible to store snapshot on another disk....
> >
> >
> >   Cordialement,
> >
> >    *MARTINEAU
> > Antony*
> > Service informatique
> > Assistant informatique
> > LIPPI Management La Fouillouse
> > 16440 Mouthiers sur Boheme
> > Tel.: 05.45.67.34.35
> > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
> > **http://www.lippi.fr* <http://www.lippi.fr/>
> >
> >
> >
> >   De : "Larry Dickson" <ldickson@cuttedge.com> Pour : "LVM general
> > discussion and development" <linux-lvm@redhat.com> Date: 06/06/2008 
16:19 Objet
> > : Re: [linux-lvm] Performance tunning on LVM2
> > ------------------------------
> >
> >
> >
> > This looks like the result of excessive seeking. Are origin volume and
> > snapshot both on the same physical drive? Is it possible to make a 
volume
> > group out of two drives, and arrange things so that origin volume and
> > snapshot are hitting different disks?
> >
> > Larry Dickson
> > Cutting Edge Networked Storage
> >
> > On 6/6/08, *Antony MARTINEAU* 
<*Antony.MARTINEAU@lippi.fr*<Antony.MARTINEAU@lippi.fr>>
> > wrote:
> >
> > Hello,
> > My configuration:
> > Server DELL 2860 Intel(R) Xeon(R) CPU  X3230 @ 2.66GHz (Quad Core)
> > 8GB of  memory
> > 2 x SAS 15000 300G0 RAID 0 hardware
> > SLES 10 SP2
> > Kernel 2.6.16.60-0.21-xen
> >
> > i have one volume group vg0 ( whith one PV, the two disks in raid0) 
whith
> > many lvm
> > I am very surprise about LVM2 performance when a snapshot is done.
> > Write speed on the Original volume is very bad when a snaphot is 
active...
> >
> > For exemple:
> > *
> > Speed on /dev/vg0/test when there is NO snapshot :*
> >
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> > *
> > Speed on /dev/vg0/test when there is one snapshot of this original 
volume :
> > *
> >
> > suse2:~ # lvremove --force /dev/vg0/test3.snap
> >  Logical volume "test3.snap" successfully removed
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> > suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test
> >  Logical volume "test.snap" created
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s
> >
> > *
> > Speed on /dev/vg0/test when there is 2 snapshots of this original 
volume :
> > *
> >
> > suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test
> >  Logical volume "test1.snap" created
> > suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test
> >  Logical volume "test2.snap" created
> > suse2:~ # lvremove /dev/vg0/test2.snap
> > Do you really want to remove active logical volume "test2.snap"? 
[y/n]: y
> >  Logical volume "test2.snap" successfully removed
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s
> >
> >
> > Do you know  some elements about tunning performance?,?
> >
> > Performances are disastrous when a snaphot is active
> > Could you give your speed result? and your amelioration??
> >
> > ps:Results are the same whithout Kernel Xen and whith a kernel more 
recent
> > (*2.6.24.2* <http://2.6.24.2/>)  Cordialement,
> >    *MARTINEAU
> > Antony*
> > Service informatique
> > Assistant informatique
> > LIPPI Management La Fouillouse
> > 16440 Mouthiers sur Boheme
> > Tel.: 05.45.67.34.35
> > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
> > **http://www.lippi.fr* <http://www.lippi.fr/>
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > Ce message et toutes les pieces jointes sont etablis a l'attention
> > exclusive de ses destinataires et sont strictement confidentiels. 
*Pour en
> > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
> >
> > This message and any attachments are confidential to the ordinary user 
of
> > the e-mail address to which it was addressed and may also be 
privileged. *More
> > information* <http://www.lippi.fr/disclaimer.php>
> >
> >
> > _______________________________________________
> > linux-lvm mailing list*
> > **linux-lvm@redhat.com* <linux-lvm@redhat.com>*
> > **https://www.redhat.com/mailman/listinfo/linux-lvm*<
https://www.redhat.com/mailman/listinfo/linux-lvm>
> > read the LVM HOW-TO at *http://tldp.org/HOWTO/LVM-HOWTO/*<
http://tldp.org/HOWTO/LVM-HOWTO/>
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > Ce message et toutes les pieces jointes sont etablis a l'attention
> > exclusive de ses destinataires et sont strictement confidentiels. 
*Pour en
> > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
> >
> > This message and any attachments are confidential to the ordinary user 
of
> > the e-mail address to which it was addressed and may also be 
privileged. *More
> > information* <http://www.lippi.fr/disclaimer.php>
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >




> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/










Ce message et toutes les pieces jointes sont etablis a l'attention 
exclusive de ses destinataires et sont strictement confidentiels. Pour en 
savoir plus cliquer ici

This message and any attachments are confidential to the ordinary user of 
the e-mail address to which it was addressed and may also be privileged. 
More information


--=_alternative 00377B40C1257463_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Thanks for your answer...</font>
<br><font size=2 face="sans-serif">But my test show that it is, the LVM2
software the probleme...</font>
<br>
<br><font size=2 face="sans-serif">Because even whith 3 writing test at
the same time on 3 LV which are on the same VG and the same PV, the performance
are better than one LV whith only one snapshot...</font>
<br>
<br><font size=2 face="sans-serif">Look this test:</font>
<br>
<br><font size=2 face="sans-serif">suse2:~ # dd if=/dev/zero of=/dev/vg0/test
bs=10M count=150</font>
<br><font size=2 face="sans-serif">150+0 records in</font>
<br><font size=2 face="sans-serif">150+0 records out</font>
<br><font size=2 face="sans-serif">1572864000 bytes (1.6 GB) copied, 27.9422
seconds, 56.3 MB/s</font>
<br>
<br><font size=2 face="sans-serif">suse2:~ # dd if=/dev/zero of=/dev/vg0/test2
bs=10M count=150</font>
<br><font size=2 face="sans-serif">150+0 records in</font>
<br><font size=2 face="sans-serif">150+0 records out</font>
<br><font size=2 face="sans-serif">1572864000 bytes (1.6 GB) copied, 33.2836
seconds, 47.3 MB/s</font>
<br>
<br><font size=2 face="sans-serif">suse2:~ # dd if=/dev/zero of=/dev/vg0/test3
bs=10M count=150</font>
<br><font size=2 face="sans-serif">150+0 records in</font>
<br><font size=2 face="sans-serif">150+0 records out</font>
<br><font size=2 face="sans-serif">1572864000 bytes (1.6 GB) copied, 33.784
seconds, 46.6 MB/s</font>
<br>
<br><font size=2 face="sans-serif">With 3 writing test AT THE SAME TIME
, the average is better that one writing test on one LV whith one snap</font>
<br>
<br><font size=2 face="sans-serif">Look,</font>
<br>
<br><font size=2 face="sans-serif">suse2:~ # lvcreate -s -L2G -ntest.snap
/dev/vg0/test</font>
<br><font size=2 face="sans-serif">&nbsp; Logical volume &quot;test.snap&quot;
created</font>
<br>
<br><font size=2 face="sans-serif">suse2:~ # dd if=/dev/zero of=/dev/vg0/test
bs=10M count=150</font>
<br><font size=2 face="sans-serif">150+0 records in</font>
<br><font size=2 face="sans-serif">150+0 records out</font>
<br><font size=2 face="sans-serif">1572864000 bytes (1.6 GB) copied, 382.315
seconds, 4.1 MB/s</font>
<br>
<br><font size=2 face="sans-serif">It is disastrous...</font>
<br>
<br><font size=2 face="sans-serif">I think dd is a good test...</font>
<br><font size=2 face="sans-serif"><br>
</font>
<table>
<tr>
<td><font size=2 face="Arial">Cordialement,<br>
</font></table>
<br>
<table>
<tr>
<td colspan=2>
<div align=center><img src=cid:_1_09EC9C9809EC98C400377B40C1257463></div>
<tr>
<td><font size=3 face="Arial"><b>MARTINEAU<br>
Antony</b> </font><font size=2 color=#808080 face="Arial"><br>
Service informatique </font><font size=1 color=#808080 face="Arial"><br>
Assistant informatique <br>
LIPPI Management </font>
<td><font size=1 color=#004080 face="Arial">La Fouillouse<br>
16440 Mouthiers sur Boheme <br>
Tel.: 05.45.67.34.35<br>
Courriel: </font><a href=mailto:antony.martineau@lippi.fr><font size=1 color=blue face="Arial"><u>antony.martineau@lippi.fr</u></font></a><font size=1 color=blue face="Arial"><u><br>
</u></font><a href=http://www.lippi.fr/><font size=1 color=blue face="Arial"><u>http://www.lippi.fr</u></font></a><font size=1 color=#004080 face="Arial">
</font></table>
<br>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">De :</font>
<td><font size=1 face="sans-serif">Heinz Mauelshagen &lt;mauelshagen@redhat.com&gt;</font>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">Pour :</font>
<td><font size=1 face="sans-serif">LVM general discussion and development
&lt;linux-lvm@redhat.com&gt;</font>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">Date:</font>
<td><font size=1 face="sans-serif">09/06/2008 11:46</font>
<tr valign=top>
<td><font size=1 color=#5f5f5f face="sans-serif">Objet :</font>
<td><font size=1 face="sans-serif">Re: [linux-lvm] Performance tunning
on LVM2</font></table>
<br>
<hr noshade>
<br>
<br>
<br><tt><font size=2>On Fri, Jun 06, 2008 at 08:03:51AM -0700, Larry Dickson
wrote:<br>
&gt; A (linear) volume group made of two physical volumes consists of one
PV<br>
&gt; followed by the other, rather like a &quot;Raid-Linear&quot;. If you
size the<br>
&gt; origin logical volume right, you can get one LV (the origin) to fall
on one<br>
&gt; disk, and force the snapshot to land on the other disk. This eliminates<br>
&gt; back-and-forth seeking to the COW. Whether it solves your problem
will<br>
&gt; depend on how smart the driver is about the read-before-write activity
on<br>
&gt; the origin volume.<br>
&gt; <br>
&gt; Other members of the list may have more experience on this. Comments?<br>
<br>
If I read correctly, Antony just has *ONE* PV.<br>
<br>
So no matter what, he has to add another to allow for snapshot COW<br>
store allocation on that other PV, distinct from the one holding<br>
the origin(s). Presumably there's no other bottleneck aside from the<br>
disk, that'll do better.<br>
<br>
Keep in mind, that unless you've got streaming writes, the performance<br>
won't drop as much as in the (artificial) dd test below.<br>
<br>
FYI: With the current snapshot implementation, multiple snapshots per single<br>
 &nbsp; &nbsp; origin will throttle write performance because of write
duplication<br>
 &nbsp; &nbsp; to all per snapshot COW stores.<br>
<br>
Heinz<br>
<br>
&gt; <br>
&gt; Larry<br>
&gt; <br>
&gt; On 6/6/08, Antony MARTINEAU &lt;Antony.MARTINEAU@lippi.fr&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)<br>
&gt; &gt; I have only this raid on the server<br>
&gt; &gt;<br>
&gt; &gt; But i don't understand, imagine i make a volume group &nbsp;ou
of this raid0. It<br>
&gt; &gt; is no possible to snapshot the original volume, am i wrong?<br>
&gt; &gt;<br>
&gt; &gt; If i make a new VG on another disks, For exemple /dev/vg1/<br>
&gt; &gt; LVM don't permit to store a snaphot on a different VG than the
origin<br>
&gt; &gt; volum.<br>
&gt; &gt;<br>
&gt; &gt; for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap<br>
&gt; &gt;<br>
&gt; &gt; LV test and LV test.snap must be on the same volume, am i wrong
???? so it<br>
&gt; &gt; is impossible to store snapshot on another disk....<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; Cordialement,<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; &nbsp;*MARTINEAU<br>
&gt; &gt; Antony*<br>
&gt; &gt; Service informatique<br>
&gt; &gt; Assistant informatique<br>
&gt; &gt; LIPPI Management La Fouillouse<br>
&gt; &gt; 16440 Mouthiers sur Boheme<br>
&gt; &gt; Tel.: 05.45.67.34.35<br>
&gt; &gt; Courriel: *antony.martineau@lippi.fr* &lt;antony.martineau@lippi.fr&gt;*<br>
&gt; &gt; **http://www.lippi.fr* &lt;</font></tt><a href=http://www.lippi.fr/><tt><font size=2>http://www.lippi.fr/</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; De : &quot;Larry Dickson&quot; &lt;ldickson@cuttedge.com&gt;
Pour : &quot;LVM general<br>
&gt; &gt; discussion and development&quot; &lt;linux-lvm@redhat.com&gt;
Date: 06/06/2008 16:19 Objet<br>
&gt; &gt; : Re: [linux-lvm] Performance tunning on LVM2<br>
&gt; &gt; ------------------------------<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This looks like the result of excessive seeking. Are origin volume
and<br>
&gt; &gt; snapshot both on the same physical drive? Is it possible to make
a volume<br>
&gt; &gt; group out of two drives, and arrange things so that origin volume
and<br>
&gt; &gt; snapshot are hitting different disks?<br>
&gt; &gt;<br>
&gt; &gt; Larry Dickson<br>
&gt; &gt; Cutting Edge Networked Storage<br>
&gt; &gt;<br>
&gt; &gt; On 6/6/08, *Antony MARTINEAU* &lt;*Antony.MARTINEAU@lippi.fr*&lt;Antony.MARTINEAU@lippi.fr&gt;&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt; My configuration:<br>
&gt; &gt; Server DELL 2860 Intel(R) Xeon(R) CPU &nbsp;X3230 @ 2.66GHz (Quad
Core)<br>
&gt; &gt; 8GB of &nbsp;memory<br>
&gt; &gt; 2 x SAS 15000 300G0 RAID 0 hardware<br>
&gt; &gt; SLES 10 SP2<br>
&gt; &gt; Kernel 2.6.16.60-0.21-xen<br>
&gt; &gt;<br>
&gt; &gt; i have one volume group vg0 ( whith one PV, the two disks in
raid0) whith<br>
&gt; &gt; many lvm<br>
&gt; &gt; I am very surprise about LVM2 performance when a snapshot is
done.<br>
&gt; &gt; Write speed on the Original volume is very bad when a snaphot
is active...<br>
&gt; &gt;<br>
&gt; &gt; For exemple:<br>
&gt; &gt; *<br>
&gt; &gt; Speed on /dev/vg0/test when there is NO snapshot :*<br>
&gt; &gt;<br>
&gt; &gt; suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400<br>
&gt; &gt; 400+0 records in<br>
&gt; &gt; 400+0 records out<br>
&gt; &gt; 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s<br>
&gt; &gt; *<br>
&gt; &gt; Speed on /dev/vg0/test when there is one snapshot of this original
volume :<br>
&gt; &gt; *<br>
&gt; &gt;<br>
&gt; &gt; suse2:~ # lvremove --force /dev/vg0/test3.snap<br>
&gt; &gt; &nbsp;Logical volume &quot;test3.snap&quot; successfully removed<br>
&gt; &gt; suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400<br>
&gt; &gt; 400+0 records in<br>
&gt; &gt; 400+0 records out<br>
&gt; &gt; 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s<br>
&gt; &gt; suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test<br>
&gt; &gt; &nbsp;Logical volume &quot;test.snap&quot; created<br>
&gt; &gt; suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400<br>
&gt; &gt; 400+0 records in<br>
&gt; &gt; 400+0 records out<br>
&gt; &gt; 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s<br>
&gt; &gt;<br>
&gt; &gt; *<br>
&gt; &gt; Speed on /dev/vg0/test when there is 2 snapshots of this original
volume :<br>
&gt; &gt; *<br>
&gt; &gt;<br>
&gt; &gt; suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test<br>
&gt; &gt; &nbsp;Logical volume &quot;test1.snap&quot; created<br>
&gt; &gt; suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test<br>
&gt; &gt; &nbsp;Logical volume &quot;test2.snap&quot; created<br>
&gt; &gt; suse2:~ # lvremove /dev/vg0/test2.snap<br>
&gt; &gt; Do you really want to remove active logical volume &quot;test2.snap&quot;?
[y/n]: y<br>
&gt; &gt; &nbsp;Logical volume &quot;test2.snap&quot; successfully removed<br>
&gt; &gt; suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400<br>
&gt; &gt; 400+0 records in<br>
&gt; &gt; 400+0 records out<br>
&gt; &gt; 838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Do you know &nbsp;some elements about tunning performance?,?<br>
&gt; &gt;<br>
&gt; &gt; Performances are disastrous when a snaphot is active<br>
&gt; &gt; Could you give your speed result? and your amelioration??<br>
&gt; &gt;<br>
&gt; &gt; ps:Results are the same whithout Kernel Xen and whith a kernel
more recent<br>
&gt; &gt; (*2.6.24.2* &lt;</font></tt><a href=http://2.6.24.2/><tt><font size=2>http://2.6.24.2/</font></tt></a><tt><font size=2>&gt;)
&nbsp;Cordialement,<br>
&gt; &gt; &nbsp; &nbsp;*MARTINEAU<br>
&gt; &gt; Antony*<br>
&gt; &gt; Service informatique<br>
&gt; &gt; Assistant informatique<br>
&gt; &gt; LIPPI Management La Fouillouse<br>
&gt; &gt; 16440 Mouthiers sur Boheme<br>
&gt; &gt; Tel.: 05.45.67.34.35<br>
&gt; &gt; Courriel: *antony.martineau@lippi.fr* &lt;antony.martineau@lippi.fr&gt;*<br>
&gt; &gt; **http://www.lippi.fr* &lt;</font></tt><a href=http://www.lippi.fr/><tt><font size=2>http://www.lippi.fr/</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Ce message et toutes les pieces jointes sont etablis a l'attention<br>
&gt; &gt; exclusive de ses destinataires et sont strictement confidentiels.
*Pour en<br>
&gt; &gt; savoir plus cliquer ici* &lt;</font></tt><a href=http://www.lippi.fr/disclaimer.php><tt><font size=2>http://www.lippi.fr/disclaimer.php</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This message and any attachments are confidential to the ordinary
user of<br>
&gt; &gt; the e-mail address to which it was addressed and may also be
privileged. *More<br>
&gt; &gt; information* &lt;</font></tt><a href=http://www.lippi.fr/disclaimer.php><tt><font size=2>http://www.lippi.fr/disclaimer.php</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; linux-lvm mailing list*<br>
&gt; &gt; **linux-lvm@redhat.com* &lt;linux-lvm@redhat.com&gt;*<br>
&gt; &gt; **https://www.redhat.com/mailman/listinfo/linux-lvm*&lt;</font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt; read the LVM HOW-TO at *http://tldp.org/HOWTO/LVM-HOWTO/*&lt;</font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; linux-lvm mailing list<br>
&gt; &gt; linux-lvm@redhat.com<br>
&gt; &gt; </font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
&gt; &gt; read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Ce message et toutes les pieces jointes sont etablis a l'attention<br>
&gt; &gt; exclusive de ses destinataires et sont strictement confidentiels.
*Pour en<br>
&gt; &gt; savoir plus cliquer ici* &lt;</font></tt><a href=http://www.lippi.fr/disclaimer.php><tt><font size=2>http://www.lippi.fr/disclaimer.php</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This message and any attachments are confidential to the ordinary
user of<br>
&gt; &gt; the e-mail address to which it was addressed and may also be
privileged. *More<br>
&gt; &gt; information* &lt;</font></tt><a href=http://www.lippi.fr/disclaimer.php><tt><font size=2>http://www.lippi.fr/disclaimer.php</font></tt></a><tt><font size=2>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; linux-lvm mailing list<br>
&gt; &gt; linux-lvm@redhat.com<br>
&gt; &gt; </font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
&gt; &gt; read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
&gt; &gt;<br>
<br>
<br>
<br>
<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; linux-lvm@redhat.com<br>
&gt; </font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
&gt; read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
<br>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-<br>
<br>
Heinz Mauelshagen &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Red Hat GmbH<br>
Consulting Development Engineer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; Am Sonnenhang 11<br>
Storage Development &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 56242 Marienrachdorf<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;Germany<br>
Mauelshagen@RedHat.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PHONE +49 &nbsp;171 7803392<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;FAX &nbsp; +49 2626 924446<br>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
</font></tt><a href="https://www.redhat.com/mailman/listinfo/linux-lvm"><tt><font size=2>https://www.redhat.com/mailman/listinfo/linux-lvm</font></tt></a><tt><font size=2><br>
read the LVM HOW-TO at </font></tt><a href="http://tldp.org/HOWTO/LVM-HOWTO/"><tt><font size=2>http://tldp.org/HOWTO/LVM-HOWTO/</font></tt></a><tt><font size=2><br>
</font></tt>
<br>
<br><font size=3 face="sans-serif"><br>
<br>
<br>
</font>
<br><font size=3 face="Lucida Sans"><br>
</font><img src=http://www.lippi.fr/img/eco.jpg><font size=3 face="Lucida Sans"><br>
</font><font size=2 face="Lucida Sans"><br>
<br>
Ce message et toutes les pieces jointes sont etablis a l'attention exclusive
de ses destinataires et sont strictement confidentiels. </font><a href=http://www.lippi.fr/disclaimer.php><font size=2 color=blue face="Lucida Sans"><u>Pour
en savoir plus cliquer ici</u></font></a><font size=2 face="Lucida Sans"><br>
<br>
This message and any attachments are confidential to the ordinary user
of the e-mail address to which it was addressed and may also be privileged.
</font><a href=http://www.lippi.fr/disclaimer.php><font size=2 color=blue face="Lucida Sans"><u>More
information</u></font></a><font size=3 face="Lucida Sans"><br>
</font>
<br>
--=_alternative 00377B40C1257463_=--

--=_related 00377B40C1257463_=
Content-Type: image/gif
Content-ID: <_1_09EC9C9809EC98C400377B40C1257463>
Content-Transfer-Encoding: base64

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
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=
--=_related 00377B40C1257463_=--
