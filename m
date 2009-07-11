Date: Sat, 11 Jul 2009 09:51:44 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20090711135143.GA5404@redhat.com>
References: <2868094B-843D-47D9-BDBB-78C2408F5AC4@karlsbakk.net>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2868094B-843D-47D9-BDBB-78C2408F5AC4@karlsbakk.net>
Subject: [linux-lvm] Re: Aligning PVs on SSDs?
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
Content-Type: text/plain; charset="utf-8"
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


Roy,

You want to use: pvcreate --dataalignment 128k /dev/sdXX

This will guarantee that the start of the data area (pe_start) is
aligned on a 128k boundary.

Mike

On Sat, Jul 11 2009 at  6:23am -0400,
Roy Sigurd Karlsbakk <roy@karlsbakk.net> wrote:

> Hi
>
> I came across an article on 
> http://thunk.org/tytso/blog/2009/02/20/aligning-filesystems-to-an-ssds-erase-block-size/ 
>  about filesystem alignment. This mentions some issues about aligning  
> PVs in 128k bounderies. See snipped-out text from the article below.
>
> Are there flags like these or similar in helping admins using SSDs more 
> efficiently?
>
> roy
>
>> ...
>> So I created a 1 gigabyte /boot partition as /dev/sdb1, and allocated 
>> the rest of the SSD for use by LVM as /dev/sdb2. And that’s where I ran 
>> into my next problem. LVM likes to allocate 192k for its header 
>> information, and 192k is not a multiple of 128k. So if you are creating 
>> file systems as logical volumes, and you want those volume to be 
>> properly aligned you have to tell LVM that it should reserve slightly 
>> more space for its meta-data, so that the physical extents that it 
>> allocates for its logical volumes are properly aligned. Unfortunately, 
>> the way this is done is slightly baroque:
>>
>> # pvcreate –metadatasize 250k /dev/sdb2
>> Physical volume “/dev/sdb2″ successfully created
>>
>> Why 250k and not 256k? I can’t tell you — sometimes the LVM tools  
>> aren’t terribly intuitive. However, you can test to make sure that  
>> physical extents start at the proper offset by using:
>>
>> # pvs /dev/sdb2 -o+pe_start
>> PV         VG   Fmt  Attr PSize  PFree  1st PE
>> /dev/sdb2       lvm2 –   73.52G 73.52G 256.00K
>>
>> If you use a metadata size of 256k, the first PE will be at 320k  
>> instead of 256k. There really ought to be an –pe-align option to  
>> pvcreate, which would be far more user-friendly, but, we have to work 
>> with the tools that we have. Maybe in the next version of the LVM 
>> support tools….
>> ...
> --
> Roy Sigurd Karlsbakk
> (+47) 97542685
> roy@karlsbakk.net
> http://blogg.karlsbakk.net/
> --
> I all pedagogikk er det essensielt at pensum presenteres intelligibelt. 
> Det er et elementært imperativ for alle pedagoger å unngå eksessiv 
> anvendelse av idiomer med fremmed opprinnelse. I de fleste tilfeller 
> eksisterer adekvate og relevante synonymer på norsk.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
