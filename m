References: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
	<bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
	<64e349d5-51b1-4704-8c2d-ac038929d7e4@strike.wu.ac.at>
	<4244902f-0dd8-ea1d-2bfe-5432bff473eb@redhat.com>
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <f1a98b94-5bbd-a4a4-49ad-b920d8c8da5d@strike.wu.ac.at>
Date: Thu, 16 Nov 2017 15:16:57 +0100
MIME-Version: 1.0
In-Reply-To: <4244902f-0dd8-ea1d-2bfe-5432bff473eb@redhat.com>
Content-Language: de-AT
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM hangs
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 2017-11-16 12:47, Zdenek Kabelac wrote:
> Dne 16.11.2017 v 12:02 Alexander 'Leo' Bergolth napsal(a):
>> On 2017-11-13 15:51, Zdenek Kabelac wrote:
>>> Dne 13.11.2017 v 14:41 Alexander 'Leo' Bergolth napsal(a):
>>>> I have a EL7 desktop box with two sata harddisks and two ssds in a
>>>> LVM raid1 - thin pool - cache configuration. (Just migrated to this
>>>> setup a few weeks ago.)
>>>>
>>>> After some days, individual processes start to block in disk wait.
>>>> I don't know if the problem resides in the cache-, thin- or raid1-layer
>>>> but the underlying block-devices are fully responsive.
> 
> From the plain look over those file - it doesn't even seem there is
> anything wrong with dm devices as such.
> 
> So it looks like  possibly XFS got into some unhappy moment.
>
> I'd probably recommend to open regular  Bugzilla case  and attach files
> from your directory.

OK.

> You can try if individual devices in the  'stack' are blocked.
> i.e. try 'dd' read from every 'dm'  if there is something blocked.

No device is currently blocking. I can read from all LV devices
(including meta devices), all underlying PVs and all filesystems:

for dev in $(lvs -a -olv_dm_path --noheadings); do
  echo $dev;
  dd if=$dev of=/dev/null bs=4k count=10000 iflag=direct;
done
for pv in $(pvs -oname --noheadings); do
  echo $pv
  dd if=$pv of=/dev/null bs=4k count=10000 iflag=direct
done
echo 3 >/proc/sys/vm/drop_caches
for mp in $(findmnt -t xfs,ext4 -o TARGET -l -n); do
  echo $mp;
  tar -cf- --one-file-system "$mp" 2>/dev/null| head -c $((1024**3))
>/dev/null;
done

> From status all device looks fully operational and also process stack
> trace do look reasonable idle.
> 
> I'm not sure how 'afs' is involved here - can you reproduce without afs ?

OK. I'll try.

Thanks for your help!

--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
