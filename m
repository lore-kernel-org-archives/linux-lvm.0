References: <alpine.LRH.2.11.1603112308440.30893@mail.ewheeler.net>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56E3D6EF.3020404@redhat.com>
Date: Sat, 12 Mar 2016 09:44:31 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1603112308440.30893@mail.ewheeler.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-devel] dm-thin metadata: can two device_id's
 have the same transaction_id ?
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
To: Eric Wheeler <dm-devel@lists.ewheeler.net>, dm-devel@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Dne 12.3.2016 v 00:14 Eric Wheeler napsal(a):
>
> Hello all,
>
> For thin volumes shown in the lvm VG metadata backups in
> /etc/lvm/backup/pool, can any two device_id's have the same
> transaction_id, ever?
>
> Otherwise, can I assume that the device_id and transaction_id are both
> unique, or is only the tuple (transaction_id,device_id) unique?
>
> For example:
>
> my-thin-vol {
>          id = "M8fkBP-pFe8-Z6K0-0f7N-HAFM-Mv2v-KOTmM3"
>          status = ["READ", "WRITE", "VISIBLE"]
>          flags = ["ACTIVATION_SKIP"]
>          creation_host = "hv1.ewheeler.net"
>          creation_time = 1452374892      # 2016-01-09 13:28:12 -0800
>          segment_count = 1
>
>          segment1 {
>                  start_extent = 0
>                  extent_count = 3072     # 48 Gigabytes
>
>                  type = "thin"
>                  thin_pool = "data-pool"
>>>>>>>>>>>>>     transaction_id = 9843
>                  device_id = 5735
>                  origin = "backup2.ewheeler.net_14-drbd"
>          }
> }
>

Hi

It's rather for linux-lvm list.

Transaction_id is 24bit number - and like may be possible to wrap
although it has not been much tested in such corner case.
(I should probably add some tests around this for lvm2...)

Device_id lvm2 does not recycle ATM - so it just always seeks for
largest and picks +1.  But it doesn't mean we could not introduce
recyling at some point.

However at this moment we rather try to use unique numbers to simplify 
possible recovery steps - it's fairly simpler.

Regards

Zdenek
