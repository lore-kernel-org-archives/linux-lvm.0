Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2AAi22e016588
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 06:44:02 -0400
Received: from cluster-f.mailcontrol.com (cluster-f.mailcontrol.com
	[85.119.2.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2AAhPkx018591
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 06:43:26 -0400
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly14f.srv.mailcontrol.com (MailControl) with ESMTP id
	m2AAhIPP026637
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 10:43:19 GMT
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id KAA05685
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 10:52:00 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Restore LVM snapshot without creating a full dumpto
	an "external" device?
Date: Mon, 10 Mar 2008 10:43:18 -0000
Message-ID: <A374F37068535C46BFCF8D48CF29AA7FB358AF@zen.zetex.com>
From: "Karl Wagner" <kwagner@zetex.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

That is almost exactly what I was after.

Just one thing though... If I was to just take a backup of the COW
device, assuming the underlying origin had not changed, would I just be
able to restore this? (i.e. gzip < /path/to/cowdevice >
/path/to/backupfile.gz and restore with zcat /path/to/backup/file.gz >
/path/to/cowdevice, or similar.) Would this work with a newly created
snapshot? (ie backup as above then lvcreate -s -n newsnapshot
/path/to/origin; zcat /path/to/backup/file.gz > /path/to/new/cow/device)

I will just emphasize that the UNDERLYING ORIGIN WILL NEVER CHANGE, it
is never mounted, never used for anything except as a snapshot origin.

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Bas van Schaik
Sent: 10 March 2008 09:59
To: LVM general discussion and development
Subject: Re: [linux-lvm] Restore LVM snapshot without creating a full
dumpto an "external" device?

Lars Ellenberg wrote:
> On Sun, Mar 09, 2008 at 11:05:45PM +0100, Bas van Schaik wrote:
>   
>> Hi all,
>>
>> When I started to use LVM snapshots, I presumed that it was easy to
>> restore a system to such a snapshot. As far as I can see now, this
>> presumption was incorrect... People on the internet write that I
should
>> dump the whole snapshot using dd and then write it over the original
>> volume. This actually implies that I need another device with at
least
>> the size of the original volume available to dump to. In my
situation,
>> this means that I need about 2 TB free space to recover this
snapshot!
>>
>> Isn't there a more sophisticated way to restore the snapshot than
just
>> dumping it?
>>  1) create snapshot of /dev/myvolumegroup/myvolume to
>> /dev/myvolumegroup/mysnapshot
>>  2) dd if=/dev/myvolumegroup/mysnapshot of=/tmp/mysnapshot.dd
>>  3) lvremove /dev/myvolumegroup/mysnapshot
>>  4) dd if=/tmp/mysnapshot.dd of=/dev/myvolumegroup/myvolume
>>     
>
> you got (size-of-your-volume) free space in /tmp?
> pretty large /tmp, or pretty small volume, I guess.
>
>   
>> Something like:
>>  1) lvrevert /dev/myvolumegroup/mysnapshot
/dev/myvolumegroup/myvolume
>>
>> I'd like to hear your thoughts on this, because I think it should be
>> fairly easy to restore a COW snapshot. Or am I wrong and missing
something?
>>     
>
> you may want to investigate the status of
> http://fedoraproject.org/wiki/StatelessLinux/CachedClient
> were it says "The LVM and device-mapper code to allow merging is
> awaiting upstream review."
>   
Interesting project, interesting information, but it was last updated
2007-10-19. I'll try Googling for a more recent status, if that is
available...

> or you can try, at your own risk, the hack below.
>
> (... lots of excellent details ...)
Sounds very plausible, but there are some risks involved here ;). Thanks
anyhow, I'll really consider using your perl script when the situation
gets critical here...

  -- Bas

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 This has been checked by www.blackspider.com 


_________________________________________________________

Zetex Semiconductors - Solutions for an analog world.

http://www.zetex.com
http://www.zetex.cn

E-MAILS are susceptible to interference.  You should not assume that
the contents originated from the sender or the Zetex Group or that they 
have been accurately reproduced from their original form.
Zetex accepts no responsibility for information, errors or omissions in
this e-mail nor for its use or misuse nor for any act committed or
omitted in connection with this communication.
If in doubt, please verify the authenticity with the sender.
_________________________________________________________

 
