Message-ID: <4A0889F0.7050100@brunson.com>
Date: Mon, 11 May 2009 14:26:24 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Script to import hardware snapshoted VGs
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>	<20090508205312.GA7838@redhat.com>
	<138875.59888.qm@web87112.mail.ird.yahoo.com>
In-Reply-To: <138875.59888.qm@web87112.mail.ird.yahoo.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>

On 05/11/2009 12:39 PM, chris procter wrote:
> Hi,
>
> Here's version 2. I've got it to play nicely with device names like:-
> /dev/"__\"!@#\$%^&*,()|@||\\\""
> /dev/\*
>
> /dev/''*   (with trailing space and single quotes)
> /dev/$* ^"
> which should cover pretty much all possibilities by symlinking them from the temp directory and using the links which all seems to work and gets round issues with the filter regular expressions in lvm.conf  Hopefully that covers all the weirdness anyone is likely to use.
>
> One day I will work out how to use CVS and do proper diffs :)
>
>    

cvs add filename
cvs commit filename
cvs diff filename

:-)
