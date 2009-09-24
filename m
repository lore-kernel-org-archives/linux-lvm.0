Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8O3tss2023516
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 23:55:54 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8O3tZEa025946
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 23:55:36 -0400
Received: by yxe13 with SMTP id 13so1649991yxe.23
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 20:55:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d60517f30909222050j77b16ce7x769f442043151bbd@mail.gmail.com>
References: <d60517f30909222050j77b16ce7x769f442043151bbd@mail.gmail.com>
From: Thiago Nunes <thiagonunesrs@gmail.com>
Date: Thu, 24 Sep 2009 03:55:15 +0000
Message-ID: <d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
Content-Type: multipart/alternative; boundary=00163646da80c3d60a04744acd95
Subject: [linux-lvm] "Incorrect metadata area header checksum" after a
	pvmove and pvresize
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
To: linux-lvm@redhat.com

--00163646da80c3d60a04744acd95
Content-Type: text/plain; charset=ISO-8859-1

Hi guys.

Excuse my english, I'm from Brazil.

Last day I pvresized the pv who had my vg and after a reboot I couldn't
activate my vg anymore. I got the message "Incorrect metadata area header
checksum".

The whole history:

My HD had a sda3 pv that had my whole vg. It's had around 55GB. Some days
ago, because of an emergency situation, I transformed a 6GB partition (sda5)
into an LVM pv and added it to the vg. Now to organize my HD I liberated
space after sda5 and wanted to expand my sda3 to the end of my 80GB disk.

Then I took an auxiliar hard drive, booted my machine with system rescue cd,
created a small sdb1 in the begining to temporary store the contents of
sda5, pvcreated sdb1, "vgextend vg /dev/sdb1" and "pvmove /dev/sda5".
Everything ran ok. Then I "vgchange -a n", cfdisk on /dev/sda, deleted sda3
and recreated it in the same place but filling the drive until the final and
finaly "pvresize /dev/sda3", who now occupies almost whole drive.

Then I rebooted to continue the work with my real system running and got a
"kernel panic" with the initrd complaining about "Incorrect metadata area
header checksum", now I cannot access the metadata backup to try a
vgcfgrestore.

I searched the list but no one had suffered the same problem and LVM HOWTO
on tldp.org only shows how to recover a pv using a previous metadata backup.
I don't want to try something dangerous like a pvcreate before have sure
it's will not wipe out all my data.

Someone knows what I made wrong and what I can do to put my vg to work
again?

At this URL are the results of many useful commands:
http://200.19.254.116/~thiago/arquivos-lvm/<http://200.19.254.116/%7Ethiago/arquivos-lvm/>

As can I see the sda has a pvmove0 lv just where was my old sda5. What this
fucking sheet are still doing there? This shouldn't have been excluded?

The lv hosted in the old sda5 is a part of tmp-paludis lv. Why the pvmove0
on sdb1 was not renamed to the correct name tmp-paludis?

Any help will be apreciated.

Thiago.

--00163646da80c3d60a04744acd95
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi guys.<br><br>Excuse my english, I&#39;m from Brazil.<br><br>Last day I p=
vresized the pv who had my vg and after a reboot I couldn&#39;t activate my=
 vg anymore. I got the message &quot;Incorrect metadata area header checksu=
m&quot;.<br>



<br>The whole history:<br><br>My HD had a sda3 pv that had my whole vg. It&=
#39;s had around 55GB. Some days ago, because of an emergency situation, I =
transformed a 6GB partition (sda5) into an LVM pv and added it to the vg. N=
ow to organize my HD I liberated space after sda5 and wanted to expand my s=
da3 to the end of my 80GB disk.<br>



<br>Then I took an auxiliar hard drive, booted my machine with system rescu=
e cd, created a small sdb1 in the begining to temporary store the contents =
of sda5, pvcreated sdb1, &quot;vgextend vg /dev/sdb1&quot; and &quot;pvmove=
 /dev/sda5&quot;. Everything ran ok. Then I &quot;vgchange -a n&quot;, cfdi=
sk on /dev/sda, deleted sda3 and recreated it in the same place but filling=
 the drive until the final and finaly &quot;pvresize /dev/sda3&quot;, who n=
ow occupies almost whole drive.<br>



<br>Then I rebooted to continue the work with my real system running and go=
t a &quot;kernel panic&quot; with the initrd complaining about &quot;Incorr=
ect metadata area header checksum&quot;, now I cannot access the metadata b=
ackup to try a vgcfgrestore.<br>



<br>I searched the list but no one had suffered the same problem and LVM HO=
WTO on <a href=3D"http://tldp.org" target=3D"_blank">tldp.org</a> only show=
s how to recover a pv using a previous metadata backup. I don&#39;t want to=
 try something dangerous like a pvcreate before have sure it&#39;s will not=
 wipe out all my data.<br>



<br>Someone knows what I made wrong and what I can do to put my vg to work =
again?<br><br>At this URL are the results of many useful commands: <a href=
=3D"http://200.19.254.116/%7Ethiago/arquivos-lvm/" target=3D"_blank">http:/=
/200.19.254.116/~thiago/arquivos-lvm/</a><br>


<br>As can I see the sda has a pvmove0 lv just where was my old sda5. What =
this fucking sheet are still doing there? This shouldn&#39;t have been excl=
uded?<br><br>The lv hosted in the old sda5 is a part of tmp-paludis lv. Why=
 the pvmove0 on sdb1 was not renamed to the correct name tmp-paludis?<br>


<br>Any help will be apreciated.<br><br>Thiago.<br><br>

--00163646da80c3d60a04744acd95--
