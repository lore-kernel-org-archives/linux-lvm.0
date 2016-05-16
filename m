References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5739B848.3060505@redhat.com>
Date: Mon, 16 May 2016 14:08:40 +0200
MIME-Version: 1.0
In-Reply-To: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, g.danti@assyoma.it

On 15.5.2016 12:33, Gionatan Danti wrote:
> Hi list,
> I had an unexptected filesystem unmount on a machine were I am using thin
> provisioning.
>

Hi

Well yeah - ATM we rather take 'early' action and try to stop any user
on overfill thin-pool.



> It is a CentOS 7.2 box (kernel 3.10.0-327.3.1.el7, lvm2-2.02.130-5.el7_2.1),
> with the current volumes situation:
> # lvs -a
>    LV                   VG         Attr       LSize  Pool         Origin
> Data%  Meta%  Move Log Cpy%Sync Convert
>    000-ThinPool         vg_storage twi-aotz-- 10.85t 74.06  33.36
>    [000-ThinPool_tdata] vg_storage Twi-ao---- 10.85t
>    [000-ThinPool_tmeta] vg_storage ewi-ao---- 88.00m
>    Storage              vg_storage Vwi-aotz-- 10.80t 000-ThinPool 74.40
>    [lvol0_pmspare]      vg_storage ewi------- 88.00m
>    root                 vg_system  -wi-ao---- 55.70g
>    swap                 vg_system  -wi-ao----  7.81g
>
> As you can see, thin pool/volume is at about 75%.
>
> Today I found the Storage volume unmounted, with the following entries in
> /var/log/message:
> May 15 09:02:53 storage lvm[43289]: Request to lookup VG vg_storage in lvmetad
> gave response Connection reset by peer.
> May 15 09:02:53 storage lvm[43289]: Volume group "vg_storage" not found
> May 15 09:02:53 storage lvm[43289]: Failed to extend thin
> vg_storage-000--ThinPool-tpool.
> May 15 09:02:53 storage lvm[43289]: Unmounting thin volume
> vg_storage-000--ThinPool-tpool from /opt/storage.

Basically whenever  'lvresize' failed - dmeventd plugin now tries
to unconditionally umount any associated thin-volume with
thin-pool above threshold.


> What puzzle me is that both thin_pool_autoextend_threshold and
> snap_pool_autoextend_threshold are disabled in the lvm.conf file
> (thin_pool_autoextend_threshold = 100 and snap_pool_autoextend_threshold =
> 100). Moreover, no custom profile/policy is attached to the thin pool/volume.

For now  -  plugin   'calls'  the tool - lvresize --use-policies.
If this tool FAILs for ANY  reason ->  umount will happen.

I'll probably put in 'extra' test that 'umount' happens
with  >=95% values only.

dmeventd  itself has no idea if there is configure 100 or less - it's the 
lvresize to see it - so even if you set 100% - and you have enabled
monitoring  - you will get umount (but no resize)


>
> To me, it seems that the lvmetad crashed/had some problems and the system,
> being "blind" about the thin volume utilization, put it offline. But I can not
> understand the "Failed to extend thin vg_storage-000--ThinPool-tpool", and I
> had *no* autoextend in place.

If you strictly don't care about any tracing of thin-pool fullness,
disable  monitoring in lvm.conf.


>
> I rebooted the system and the Storage volume is now mounted without problems.
> I also tried to write about 16 GB of raw data to it, and I have no problem.
> However, I can not understand why it was put offline in the first place. As a
> last piece of information, I noted that kernel & lvm was auto-updated two days
> ago. Maybe it is related?
>
> Can you give me some hint of what happened, and how to avoid it in the future?

Well 'lvmetad' shall not crash, ATM this may kill commands - and further stop 
processing - as we rather 'stop' further usage rather than allowing
to cause bigger damage.

So if you have unusual system/device setup causing  'lvmetad' crash - open BZ,
and meawhile  set   'use_lvmetad=0' in your lvm.conf till the bug is fixed.

Regards

Zdenek
