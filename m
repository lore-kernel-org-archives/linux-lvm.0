Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42EPmPJ015675
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:25:49 -0400
Received: from mu-out-0910.google.com (mu-out-0910.google.com [209.85.134.189])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42EPYDu007618
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:25:34 -0400
Received: by mu-out-0910.google.com with SMTP id w8so394101mue.1
	for <linux-lvm@redhat.com>; Fri, 02 May 2008 07:25:33 -0700 (PDT)
Message-ID: <1c748a490805020725l50cc0fbpc305b0bb8c4221e0@mail.gmail.com>
Date: Fri, 2 May 2008 07:25:32 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481B1E6D.3040000@verizon.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11916_33206517.1209738332835"
References: <4817C2FD.1010909@verizon.net> <481A08A7.5010305@verizon.net>
	<481A0E28.5030108@Media-Brokers.com> <481A1C09.7070508@verizon.net>
	<481A1D32.6020705@Media-Brokers.com> <481A1FAF.5050303@verizon.net>
	<481A221D.80209@Media-Brokers.com> <481A262C.7080908@verizon.net>
	<1311113506.20080502101444@marki-online.net>
	<481B1E6D.3040000@verizon.net>
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

------=_Part_11916_33206517.1209738332835
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Once the device with the snapshot disappears, I'm not sure I would trust
> that snapshot even if the device comes back online.

The COW operation implies you can trust that snapshot if, and only if,
nothing was written to the origin volume between when the snapshot
disappeared and when it came back on line. Perhaps a "Has been written" flag
could be maintained for the origin volume starting at reboot.

Larry Dickson

On 5/2/08, Gerry Reno <greno@verizon.net> wrote:
>
> Marek Podmaka wrote:
>
>> Hi Gerry,
>>
>> Thursday, May 1, 2008, 22:21:00, Gerry Reno wrote:
>>
>>
>>
>>> At least in the case where the snapshot is read-only (LVM1 default,
>>> LVM2 by config?), if the snapshot is lost, invalid, not removed from
>>> VG prior to reboot, when LVM comes back up it should see this and
>>> immediately know that it can just vgreduce VG --removemissing for
>>> the old snapshot. In the case of rw (no LVM1, LVM2 default), it
>>> should be a user choice and LVM should prompt the user at boot as to
>>> whether to remove this old snapshot so it can attempt to activate
>>> the VG. Unless the user knows that there were non-backup related lvm
>>> mods written during the snapshot (eg: pvmove) then the user will
>>> just answer yes and the system should boot. This is how LVM should
>>> operate in this scenario.
>>>
>>>
>>
>> I don't think that automatically making changes to the VG is a good
>> idea. Imagine that you have a snapshot on disk mapped from SAN storage
>> array and that becomes temporary unavailable (SAN switch failure or
>> whatever). It would be a bad idea to remove this PV from VG just
>> because it is TEMPORARY unavailable.
>>
> This was part of my point about the ramdisk, in that other types of devices
> can also disappear not just ramdisk.
> Once the device with the snapshot disappears, I'm not sure I would trust
> that snapshot even if the device comes back online.
> The backup process would try to keep running and it would probably get all
> kinds of errors at this point so to me it
> makes sense to consider that snapshot invalid from that standpoint of the
> backup. Now if it was a read-write snapshot
> and you've used some lvm commands to pvmove something onto the snapshot
> then that is why I suggest that the user
> be able to make decision at reboot about whether to remove the PV. If they
> answer 'no' to the removal then the boot will
> stop and they will have to perform some recovery through the rescue mode to
> see if they can recover some data from
> the device before allowing the PV to be removed from the VG so the system
> can boot.
>
> And how do you distinguish
>> between ram disk and normal disk and if it is totally gone or it is
>> only temp issue? Also if real HDD fails, you don't want to vgreduce
>> it, you want to replace it, vgcfgrestore it and sync it (in case you
>> are using mirroring). Also imagine that you can have also real data on
>> the same PV, not only snapshot.
>>
>>
> You don't vgreduce the entire hdd. Only for the PV that contained the
> snapshot.
> If you used an entire hdd to be the snapshot then you can restore it.
> Recover data
> in the case of read-write and then vgreduce it from the VG so system can
> boot.
>
> What would help is the ability to activate the VG also with missing
>> PVs,
>>
> You cannot activate a VG with missing PV's because at some point then LVM
> would attempt to write
> on one of the missing PV and then you get panic.
>
>
> Regards,
> Gerry
>
>
> I'm not sure if that is possible in linux LVM.
>>
>>
>>
>>
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_11916_33206517.1209738332835
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>&gt; Once the device with the snapshot disappears, I&#39;m not sure I would trust</div>
<div>&gt;&nbsp;that snapshot even if the device comes back online.<br><br>The COW operation implies you can trust that snapshot if, and only if, nothing was written to the origin volume between when the snapshot disappeared and when it came back on line. Perhaps a &quot;Has been written&quot; flag could be maintained for the origin volume starting at reboot.</div>

<div>&nbsp;</div>
<div>Larry Dickson<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/2/08, <b class="gmail_sendername">Gerry Reno</b> &lt;<a href="mailto:greno@verizon.net">greno@verizon.net</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">Marek Podmaka wrote:<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi Gerry,<br><br>Thursday, May 1, 2008, 22:21:00, Gerry Reno wrote:<br><br>&nbsp;<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">At least in the case where the snapshot is read-only (LVM1 default,<br>LVM2 by config?), if the snapshot is lost, invalid, not removed from<br>
VG prior to reboot, when LVM comes back up it should see this and<br>immediately know that it can just vgreduce VG --removemissing for<br>the old snapshot. In the case of rw (no LVM1, LVM2 default), it<br>should be a user choice and LVM should prompt the user at boot as to<br>
whether to remove this old snapshot so it can attempt to activate<br>the VG. Unless the user knows that there were non-backup related lvm<br>mods written during the snapshot (eg: pvmove) then the user will<br>just answer yes and the system should boot. This is how LVM should<br>
operate in this scenario.<br>&nbsp; &nbsp;<br></blockquote><br>I don&#39;t think that automatically making changes to the VG is a good<br>idea. Imagine that you have a snapshot on disk mapped from SAN storage<br>array and that becomes temporary unavailable (SAN switch failure or<br>
whatever). It would be a bad idea to remove this PV from VG just<br>because it is TEMPORARY unavailable. <br></blockquote></span>This was part of my point about the ramdisk, in that other types of devices can also disappear not just ramdisk.<br>
Once the device with the snapshot disappears, I&#39;m not sure I would trust that snapshot even if the device comes back online.<br>The backup process would try to keep running and it would probably get all kinds of errors at this point so to me it<br>
makes sense to consider that snapshot invalid from that standpoint of the backup. Now if it was a read-write snapshot<br>and you&#39;ve used some lvm commands to pvmove something onto the snapshot then that is why I suggest that the user<br>
be able to make decision at reboot about whether to remove the PV. If they answer &#39;no&#39; to the removal then the boot will<br>stop and they will have to perform some recovery through the rescue mode to see if they can recover some data from<br>
the device before allowing the PV to be removed from the VG so the system can boot.<span class="q"><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">And how do you distinguish<br>between ram disk and normal disk and if it is totally gone or it is<br>only temp issue? Also if real HDD fails, you don&#39;t want to vgreduce<br>
it, you want to replace it, vgcfgrestore it and sync it (in case you<br>are using mirroring). Also imagine that you can have also real data on<br>the same PV, not only snapshot.<br>&nbsp;<br></blockquote></span>You don&#39;t vgreduce the entire hdd. Only for the PV that contained the snapshot.<br>
If you used an entire hdd to be the snapshot then you can restore it. Recover data<br>in the case of read-write and then vgreduce it from the VG so system can boot.<span class="q"><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">What would help is the ability to activate the VG also with missing<br>PVs, <br></blockquote></span>You cannot activate a VG with missing PV&#39;s because at some point then LVM would attempt to write<br>
on one of the missing PV and then you get panic.<br><br><br>Regards,<br><span class="sg">Gerry</span><span class="q"><br><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">I&#39;m not sure if that is possible in linux LVM.<br><br><br><br>&nbsp;<br></blockquote><br></span>
<div><span class="e" id="q_119a9efd4db46cc7_8">_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</span></div></blockquote></div><br>

------=_Part_11916_33206517.1209738332835--
