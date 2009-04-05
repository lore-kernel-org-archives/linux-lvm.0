Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n35LCYdI010734
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 17:12:34 -0400
Received: from smtp188.iad.emailsrvr.com (smtp188.iad.emailsrvr.com
	[207.97.245.188])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n35LCB1F017445
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 17:12:11 -0400
Received: from relay18.relay.iad.mlsrvr.com (localhost [127.0.0.1])
	by relay18.relay.iad.mlsrvr.com (SMTP Server) with ESMTP id EDA5F1B401A
	for <linux-lvm@redhat.com>; Sun,  5 Apr 2009 17:12:10 -0400 (EDT)
Received: by relay18.relay.iad.mlsrvr.com (Authenticated sender:
	mfidelman-AT-traversetechnologies.com) with ESMTPSA id C51241B4002
	for <linux-lvm@redhat.com>; Sun,  5 Apr 2009 17:12:10 -0400 (EDT)
Message-ID: <49D91EAA.4080508@traversetechnologies.com>
Date: Sun, 05 Apr 2009 17:12:10 -0400
From: Miles Fidelman <mfidelman@traversetechnologies.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] progress, but... - re. fixing LVM/md snafu
References: <49D8E4EE.3020703@traversetechnologies.com>
	<49DD2D4E-9D47-47D1-BB70-C85DE4D9C9AB@engineyard.com>
In-Reply-To: <49DD2D4E-9D47-47D1-BB70-C85DE4D9C9AB@engineyard.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jayson,

This is VERY helpful. Thanks!

Miles

Jayson Vantuyl wrote:
> Miles,
>
> It seems like what's probably happened is that LVM detected the raw=20
> device instead of the MD device at some point early in the boot=20
> process. This may be because the MD detection happened after LVM=20
> setup. I'm unsure if it's possible for LVM to "steal" the device from MD.
>
> Depending on your distribution, this may require different things to=20
> fix. Stop worrying about downtime. If the data is important, just=20
> don't worry about downtime. If downtime is really important, build a=20
> second machine, get it working right, and transfer the data. Being in=20
> a hurry and attempting to "optimize" the recovery process is a really=20
> good way to lose the data.
>
> Assuming that you're going to try to fix this setup, I'd start out=20
> with a backup. This is critical. Everybody always says to do a backup.=20
> Nobody ever does it. Really, do one. Get an S3 account, use an S3=20
> backup utility. There's just not an excuse these days. Your data is=20
> one-MD-mistake away from oblivion.
>
> So, right now MD should have sda/sdb but only has sda. sdb is now=20
> newer than sda and may have important data if this server stores=20
> anything like that. The challenge is that, according to MD, sda is=20
> newer. Since MD isn't handling writes to sdb, it won't be updating its=20
> metadata to know that it's newer. There are two options that I can=20
> think of, both ugly. Pick one of:
>
> 1. Destroy the MD. Create a new one with the same UUID and sdb3 as the=20
> source. (which you listed, the UUID part can trip you up)
> 2. Sync the updated data from sdb3 onto md2. Wipe sdb3. Add it back=20
> into md2. (might be less downtime depending on data size, doesn't nuke MD)
> 3. Build another machine. Get it working right. Transfer data with=20
> Rsync. (least downtime, most expensive)
>
> In the first two cases, this only sets you up for it to break again.=20
> The core problem is figuring out what happened during boot. In a=20
> perfect world, you would just tell LVM to only consider MD devices.=20
> That's not hard, but it's complicated by the fact that you have LVM on=20
> /. This means that the configuration that's used is likely not the=20
> version on / but a copy of it that is made when you set up your boot=20
> ramdisk (a.k.a. initrd, or possibly an initramfs). Even if we get LVM=20
> locked down to use just MDs and get that config used to boot-time,=20
> there's the possibility that the MD won't get assembled (since it=20
> already may not have been when LVM was first activated) and the system=20
> won't boot. Again, fraught with peril.
>
> If you want to fix the MD, first steps will be using a rescue LiveCD=20
> to boot up and do all of this. With that LiveCD, you can also adjust=20
> the LVM configuration and update the initrd (or whatever is used for=20
> boot). You may need to chroot into the system and/or trick the initrd=20
> into seeing the right devices. I don't really think I can walk you=20
> through this via an e-mail.
>
> The LVM part is pretty easy. Just set a filter line (you only get one,=20
> so disable any other filter lines) in <root of system>/etc/lvm.conf to:
>
>> filter =3D [ "a|^/dev/md.*$|", "r/.*/" ]
>
> That will prevent you from using anything but the MD.
>
> To update the initrd with this information depends on distro (and=20
> distro version)=EF=BF=BD. It's usually either some invocation of "mkinitr=
d" or=20
> some script that wraps it. It will get the LVM configuration available=20
> at boot-time. This *MIGHT* sort out the MD problem. It might not. If=20
> it doesn't, I'm not sure where to tell you to start. If mdadm is being=20
> used by your initrd, you'll need to tweak its configuration. If it's=20
> relying on MD autodetection, you might have turned that off in your=20
> kernel. If you have an IDE controller that takes too long to=20
> initialize, that can also cause this sort of thing (although that's=20
> REALLY unlikely these days).
>
> I hope that some of this helps. Although, it will be hard for anyone=20
> to give you really solid advice without a little more insight into why=20
> the MD isn't getting assembled prior to LVM's scan.
>
> On Apr 5, 2009, at 10:05 AM, Miles Fidelman wrote:
>
>> Hello again Folks,
>>
>> So.. I'm getting closer to fixing this messed up machine.
>>
>> Where things stand:
>>
>> I have root defined as an LVM2 LV, that should use /dev/md2 as it's PV.
>> /dev/md2 in turn is a RAID1 array built from /dev/sda3 /dev/sdb3 and=20
>> /dev/sdc3
>>
>> Instead, LVM is reporting: "Found duplicate PV=20
>> 2ppSS2q0kO3t0tuf8t6S19qY3ypWBOxF: using /dev/sdb3 not /dev/sda3"
>> and the /dev/md2 is reporting itself as inactive (cat /proc/mdstat)=20
>> and active,degraded (mdadm --detail)
>>
>> ---
>> I'm guessing that, during boot:
>>
>> - the raid array failed to start
>> - LVM found both copies of the PV, and picked one (/dev/sdb3)
>> - everything then came up and my server is humming away
>>
>> but: the md array can't rebuild because the most current device in it=20
>> is already in use
>>
>> so... I'm looking for the right sequence of events, with the minimum=20
>> downtime to:
>>
>> 1. stop changes to /dev/sdb3 (actually, to / - which complicates things)
>> 2. rebuild the RAID1 array, making sure to use /dev/sdb3 as the=20
>> starting point for current data
>> 3. restart in such a way that LVM finds /dev/md2 as the right PVM=20
>> instead of one of its components
>>
>> Each of these is just tricky enough that I'm sure there are lots of=20
>> gotchas to watch out for.
>>
>> So.. any suggestions?
>>
>> Thanks very much,
>>
>> Miles Fidelman
>>
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> --=20
> Jayson Vantuyl
> Founder and Architect
> *Engine Yard <http://www.engineyard.com>*
> jvantuyl@engineyard.com <mailto:jvantuyl@engineyard.com>
> 1 866 518 9275 ext 204
> IRC (freenode): kagato
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=20
Miles R. Fidelman, Director of Government Programs
Traverse Technologies=20
145 Tremont Street, 3rd Floor
Boston, MA  02111
mfidelman@traversetechnologies.com
857-362-8314
www.traversetechnologies.com
