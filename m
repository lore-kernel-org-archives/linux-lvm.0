Message-ID: <514450C2.4080005@hoster-ok.com>
Date: Sat, 16 Mar 2013 14:00:18 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <20130315163124.GA1061@redhat.com> <51435E8D.7090105@hoster-ok.com>
	<20130315183810.GB10892@redhat.com>
In-Reply-To: <20130315183810.GB10892@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG [SOLVED]
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
To: David Teigland <teigland@redhat.com>
Cc: Andreas Pflug <pgadmin@pse-consulting.de>, linux-lvm@redhat.com

15.03.2013 21:38, David Teigland wrote:
> On Fri, Mar 15, 2013 at 08:46:53PM +0300, Vladislav Bogdanov wrote:
>> I also thought about dlm one (may be the next step :) ), 
> 
> Let me know if you decide to start work on this and I can probably lend
> some help.
> 
>> Of course, I fully agree that clvm is just a big hack from the today's
>> point of view and something need to change here.
> 
> Since you're open to hacking components together, here's another possible
> hack:  you could create a gfs2 file system on the shared storage, and use
> file locks on gfs2 files.  The gfs2 files could be the actual vm images,
> but they do not have to be.  You could still use lv's for vms directly,
> and create empty files on gfs2 representing each lv.  The virtlockd file
> locks would be acquired on the empty gfs2 files, representing the lvs.
> This is another indirect way of using dlm locks, since the gfs2 file locks
> are passed to the dlm.

That would not solve issue with exclusive LV activation which is
required to take snapshots (and just for more safety), but prevents
migration.

Vladislav
