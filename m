References: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
	<fa1aa317-d9cd-749f-5da0-3f15bf8c4dd1@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <02958f63-ba2b-a6b5-1629-69581c1af316@assyoma.it>
Date: Tue, 27 Mar 2018 11:40:55 +0200
MIME-Version: 1.0
In-Reply-To: <fa1aa317-d9cd-749f-5da0-3f15bf8c4dd1@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 27/03/2018 10:30, Zdenek Kabelac wrote:
> Hi
> 
> Well just for the 1st. look -� 116MB for metadata for 7.21TB is *VERY* 
> small size. I'm not sure what is the data 'chunk-size'� - but you will 
> need to extend pool's metadata sooner or later considerably - I'd 
> suggest at least 2-4GB for this data size range.

Hi Zdenek,
as shown by the last lvs command, data chunk size is at 4MB. Data chunk 
size and metadata volume size where automatically selected at thin pool 
creation - ie: they are default values.

Indeed, running "thin_metadata_size -b4m -s7t -m1000 -um" show 
"thin_metadata_size - 60.80 mebibytes estimated metadata area size"

> Metadata itself are also allocated in some internal chunks - so 
> releasing a thin-volume doesn't necessarily free space in the whole 
> metadata chunks thus such chunk remains allocated and there is not a 
> more detailed free-space tracking as space in chunks is shared between 
> multiple thin volumes and is related to efficient storage of b-Trees...

Ok, so removing a snapshot/volume can free a lower than expected 
metadata amount. I fully understand that. However, I saw the *reverse*: 
removing a volume shrunk metadata (much) more than expected. This also 
mean that snapshot creation and data writes on the main volume caused a 
*much* larger than expected increase in metadata usage.

> There is no 'direct' connection between releasing space in data and 
> metadata volume - so it's quite natural you will see different 
> percentage of free space after thin volume removal between those two 
> volumes.

I understand that if data is shared between two or more volumes, 
deleting a volume will not change much from a metadata standpoint. 
However, this is true for the data pool also: it will continue to show 
the same utilization. After all, removing a shared volume only means 
that data chunk are mapped in another volume.

However, I was under impression that a more or less direct connection 
between allocated pool data chunk and metadata existed: otherwise, a 
tool as thin_metadata_size lose its scope.

So, where am I wrong?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
