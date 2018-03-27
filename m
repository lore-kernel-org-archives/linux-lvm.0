References: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <fa1aa317-d9cd-749f-5da0-3f15bf8c4dd1@redhat.com>
Date: Tue, 27 Mar 2018 10:30:17 +0200
MIME-Version: 1.0
In-Reply-To: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Higher than expected metadata usage?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 27.3.2018 v 09:44 Gionatan Danti napsal(a):
> Hi all,
> I can't wrap my head on the following reported data vs metadata usage 
> before/after a snapshot deletion.
> 
> System is an updated CentOS 7.4 x64
> 
> BEFORE SNAP DEL:
> [root@ ~]# lvs
>  � LV���������� VG�������� Attr������ LSize� Pool�������� Origin� Data% Meta%  
> Move Log Cpy%Sync Convert
>  � 000-ThinPool vg_storage twi-aot---� 7.21t��������������������� 80.26 56.88
>  � Storage����� vg_storage Vwi-aot---� 7.10t 000-ThinPool�������� 76.13
>  � ZZZSnap����� vg_storage Vwi---t--k� 7.10t 000-ThinPool Storage
> 
> As you can see, a ~80% full data pool resulted in a ~57% metadata usage
> 
> AFTER SNAP DEL:
> [root@ ~]# lvremove vg_storage/ZZZSnap
>  � Logical volume "ZZZSnap" successfully removed
> [root@ ~]# lvs
>  � LV���������� VG�������� Attr������ LSize� Pool�������� Origin Data% Meta%  
> Move Log Cpy%Sync Convert
>  � 000-ThinPool vg_storage twi-aot---� 7.21t�������������������� 74.95 36.94
>  � Storage����� vg_storage Vwi-aot---� 7.10t 000-ThinPool������� 76.13
> 
> Now data is at ~75 (5% lower), but metadata is at only ~37%: a whopping 20% 
> metadata difference for a mere 5% data freed.
> 
> This was unexpected: I thought there was a more or less linear relation 
> between data and metadata usage as, after all, the first is about allocated 
> chunks tracked by the latter. I know that snapshots pose additional overhead 
> on metadata tracking, but based on previous tests I expected this overhead to 
> be much smaller. In this case, we are speaking about a 4X amplification for a 
> single snapshot. This is concerning because I want to *never* run out of 
> metadata space.
> 
> If it can help, just after taking the snapshot I sparsified some file on the 
> mounted filesystem, *without* fstrimming it (so, from lvmthin standpoint, 
> nothing changed on chunk allocation).
> 
> What am I missing? Is the "data%" field a measure of how many data chunks are 
> allocated, or does it even track "how full" are these data chunks? This would 
> benignly explain the observed discrepancy, as a partially-full data chunks can 
> be used to store other data without any new metadata allocation.
> 
> Full LVM information:
> 
> [root@ ~]# lvs -a -o +chunk_size
>  � LV������������������ VG�������� Attr������ LSize�� Pool Origin Data%  
> Meta%� Move Log Cpy%Sync Convert Chunk
>  � 000-ThinPool�������� vg_storage twi-aot---�� 7.21t �74.95  
> 36.94��������������������������� 4.00m
>  � [000-ThinPool_tdata] vg_storage Twi-ao----�� 7.21t 
>  ������������������������������������������� 0
>  � [000-ThinPool_tmeta] vg_storage ewi-ao---- 116.00m 
>  ������������������������������������������� 0
>  � Storage������������� vg_storage Vwi-aot---�� 7.10t 000-ThinPool 
>  �76.13������������������������������������� 0
>  � [lvol0_pmspare]����� vg_storage ewi------- 116.00m 
>  ������������������������������������������� 0
>



Hi

Well just for the 1st. look -  116MB for metadata for 7.21TB is *VERY* small 
size. I'm not sure what is the data 'chunk-size'  - but you will need to 
extend pool's metadata sooner or later considerably - I'd suggest at least 
2-4GB for this data size range.

Metadata itself are also allocated in some internal chunks - so releasing a 
thin-volume doesn't necessarily free space in the whole metadata chunks thus 
such chunk remains allocated and there is not a more detailed free-space 
tracking as space in chunks is shared between multiple thin volumes and is 
related to efficient storage of b-Trees...

There is no 'direct' connection between releasing space in data and metadata 
volume - so it's quite natural you will see different percentage of free space 
after thin volume removal between those two volumes.

The only problem would be if repeated operation would lead to some permanent 
growth....

Regards

Zdenek
