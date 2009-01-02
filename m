Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n02F2H64009230
	for <linux-lvm@redhat.com>; Fri, 2 Jan 2009 10:02:17 -0500
Received: from mail-fx0-f10.google.com (mail-fx0-f10.google.com
	[209.85.220.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n02F1THZ000360
	for <linux-lvm@redhat.com>; Fri, 2 Jan 2009 10:01:40 -0500
Received: by fxm3 with SMTP id 3so1387284fxm.3
	for <linux-lvm@redhat.com>; Fri, 02 Jan 2009 07:01:28 -0800 (PST)
Message-ID: <8c87cb5a0901020701t5e34e54do90517b6e875a8f7e@mail.gmail.com>
Date: Fri, 2 Jan 2009 10:01:28 -0500
From: "Doug Eubanks" <admin@dougware.net>
Subject: Re: [linux-lvm] Re: Convert a non-striped LV to a striped LV without
	data loss?
In-Reply-To: <8c87cb5a0812310753x29ac3151ua0f8f0fd1d8b0777@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_203257_299832.1230908488097"
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
	<8c87cb5a0812301014w6b3f92c9p33e1a6d2699edb4d@mail.gmail.com>
	<20081231083116.GA1265@seneca.muc.de>
	<8c87cb5a0812310753x29ac3151ua0f8f0fd1d8b0777@mail.gmail.com>
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

------=_Part_203257_299832.1230908488097
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I ended up reformatting (after making a fresh backup) and starting over.  I
couldn't find a way to get around the metadata space limitation.  I believe
thought that I future proofed my installation so that it wouldn't happen
again.  I set aside 8M for the metadata when I used the pvcreate command.

Thanks for trying to help me out,

Sincerely,
Doug Eubanks
admin@dougware.net


On Wed, Dec 31, 2008 at 10:53 AM, Doug Eubanks <admin@dougware.net> wrote:

> I tried moving every third extend with an offset of 1 to the second
> physical volume, and every third extend with and offset of 2 to the third
> physical volume, but I ran out of metadata space about 45% through the move.
>
> I've setup a file based metadata directory, and I'm going to try to
> complete the move again.
>
> Sincerely,
> Doug Eubanks
> admin@dougware.net
>
>
> On Wed, Dec 31, 2008 at 3:31 AM, Harald Milz <hm@seneca.muc.de> wrote:
>
>> On Tue, Dec 30, 2008 at 01:14:26PM -0500, Doug Eubanks wrote:
>> > Would it be possible to extend the linear lv onto a striped lv area,
>> move
>> > the data to the new extents and then remove the old lv area using
>> lvreduce
>> > perhaps?
>>
>> Oh, that. Yes, perfectly. Add the new PVs to the VG using vgextend, then
>> create whatever LV layout you need on the new PVs (lvcreate ... -i ...
>> PV),
>> mkfs, then copy the data to the new filesystems, rearrange mountpoints,
>> then vgreduce the old PV from the VG.  Done. But not on-line... you can
>> move LVs to another PV within a VG, but you can't convert a normal LV to a
>> striped one.
>>
>> --
>> Die, v.:
>>        To stop sinning suddenly.
>>                -- Elbert Hubbard
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>

------=_Part_203257_299832.1230908488097
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I ended up reformatting (after making a fresh backup) and starting over.&nbsp; I couldn&#39;t find a way to get around the metadata space limitation.&nbsp; I believe thought that I future proofed my installation so that it wouldn&#39;t happen again.&nbsp; I set aside 8M for the metadata when I used the pvcreate command.<br>
<br>Thanks for trying to help me out,<br><br clear="all">Sincerely,<br>Doug Eubanks<br><a href="mailto:admin@dougware.net">admin@dougware.net</a><br>
<br><br><div class="gmail_quote">On Wed, Dec 31, 2008 at 10:53 AM, Doug Eubanks <span dir="ltr">&lt;<a href="mailto:admin@dougware.net">admin@dougware.net</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
I tried moving every third extend with an offset of 1 to the second physical volume, and every third extend with and offset of 2 to the third physical volume, but I ran out of metadata space about 45% through the move.<br>

<br>I&#39;ve setup a file based metadata directory, and I&#39;m going to try to complete the move again.<div class="Ih2E3d"><br><br clear="all">Sincerely,<br>Doug Eubanks<br><a href="mailto:admin@dougware.net" target="_blank">admin@dougware.net</a><br>

<br><br></div><div><div></div><div class="Wj3C7c"><div class="gmail_quote">On Wed, Dec 31, 2008 at 3:31 AM, Harald Milz <span dir="ltr">&lt;<a href="mailto:hm@seneca.muc.de" target="_blank">hm@seneca.muc.de</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div>On Tue, Dec 30, 2008 at 01:14:26PM -0500, Doug Eubanks wrote:<br>
&gt; Would it be possible to extend the linear lv onto a striped lv area, move<br>
&gt; the data to the new extents and then remove the old lv area using lvreduce<br>
&gt; perhaps?<br>
<br>
</div>Oh, that. Yes, perfectly. Add the new PVs to the VG using vgextend, then<br>
create whatever LV layout you need on the new PVs (lvcreate ... -i ... PV),<br>
mkfs, then copy the data to the new filesystems, rearrange mountpoints,<br>
then vgreduce the old PV from the VG. &nbsp;Done. But not on-line... you can<br>
move LVs to another PV within a VG, but you can&#39;t convert a normal LV to a<br>
striped one.<br>
<font color="#888888"><br>
--<br>
Die, v.:<br>
 &nbsp; &nbsp; &nbsp; &nbsp;To stop sinning suddenly.<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-- Elbert Hubbard<br>
</font><div><div></div><div><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>
</div></div></blockquote></div><br>

------=_Part_203257_299832.1230908488097--
