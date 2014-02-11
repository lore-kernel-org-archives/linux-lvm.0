Message-ID: <52FA86CC.3090409@redhat.com>
Date: Tue, 11 Feb 2014 21:23:40 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <52FA492B.1050408@funsoft.com> <52FA575E.9040305@redhat.com>
	<52FA77A4.3040206@funsoft.com>
In-Reply-To: <52FA77A4.3040206@funsoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Doc or definition of max_archives setting for
	lvm.conf?
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
To: eheman@funsoft.com, LVM general discussion and development <linux-lvm@redhat.com>

Dne 11.2.2014 20:19, Gary Eheman napsal(a):
>
> On 02/11/2014 12:01 PM, Zdenek Kabelac wrote:
>> Dne 11.2.2014 17:00, Gary Eheman napsal(a):
>>> There is an example syntax reference to a variable named "max_archives" in the
>>> man page for lvm.conf, but it does not provide a definition for the variable.
>>> The actual lvm.conf on my distribution contains no references or comments to
>>> enlighten me on the specifics for max_archives.  While the variable name
>>> certainly gives me the clue that it is likely that not more than that many
>>> archive files would exist in the archive directory, can someone provide a more
>>> detailed description?
>>>
>>> Since I can make no assumptions on this system, is it the case that if the
>>> max_archives specified in lvm.conf is reached that the oldest archive is
>>> automatically deleted as the newest one is created?
>>>
>>> I have a lot of snapshot activity on the system where I want to implement
>>> max_archives, and the number of archives keeps growing.  Naturally, I have not
>>> yet reached the retain_days number of days, but would like to keep the number
>>> of archives below a reasonable number before retain_days might be reached.
>>
>>
>> # Configuration of metadata backups and archiving.  In LVM2 when we
>> # talk about a 'backup' we mean making a copy of the metadata for the
>> # *current* system.  The 'archive' contains old metadata configurations.
>> # Backups are stored in a human readable text format.
>> backup {
>>
>>      # Should we maintain a backup of the current metadata configuration ?
>>      # Use 1 for Yes; 0 for No.
>>      # Think very hard before turning this off!
>>      backup = 1
>>
>>      # Where shall we keep it ?
>>      # Remember to back up this directory regularly!
>>      backup_dir = "/etc/lvm/backup"
>>
>>      # Should we maintain an archive of old metadata configurations.
>>      # Use 1 for Yes; 0 for No.
>>      # On by default.  Think very hard before turning this off.
>>      archive = 1
>>
>>      # Where should archived files go ?
>>      # Remember to back up this directory regularly!
>>      archive_dir = "/etc/lvm/archive"
>>
>>      # What is the minimum number of archive files you wish to keep ?
>>      retain_min = 10
>>
>>      # What is the minimum time you wish to keep an archive file for ?
>>      retain_days = 30
>> }
>>
>>
>> Zdenek
>>
>> _______________________________________________
>
> Yes, that section is precisely how my /etc/lvm/lvm.conf is coded.  But it
> still does not tell me the answers to my questions.
>
>
> ls -ltr /etc/lvm/archive/ | wc -l
> 306
>
> After 4 weeks of taking and deleting snapshots for the volumes that need to be
> backed up, I currently have 306 archive files.  What is going to make the
> number of archive files decrease (or cease increasing beyond a ceiling) on
> this system automatically?
>

retain_min - ensures this minimum number or archive for INDIVIDUAL vg is kept.
retain_days - minimum days.

So if you generate a lot of changes per day and you are not interested in long 
term history - set retain_days i.e. to 7 (week).

It's worth to note - this history is kept *PER* vg name.

So if you generate a lot of different VG names - lvm2 tool is not tracking 
other VGs then those used on command line.

You can obviously write some cron job - if you have some particular pattern of 
VG names from tests you want to delete.

Also if you are not interested at archive at all - you could simply disable 
archiving in lvm.conf  (number of copies is kept in PV metadata ring buffer,
thought its use much less comfortable...)

We may introduce maybe some warning if the size of archive directory gets too 
big and may influence performance - but its admin's task to clear them, since 
LVM has no knowledge which archives are still important.

Zdenek
