From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <20020207091636.GD5188@auctionwatch.com>
References: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
    <3C62423D.1000308@promofinarsa.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C62423D.1000308@promofinarsa.es>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Feb  7 03:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 07, 2002 at 10:00:45AM +0100, Jesus Manuel NAVARRO LOPEZ wrote:
> Hi, Anders:
> Anders Widman wrote:
> >Well, have you ever heard of diskcabbinettes? I use them alot wich means 
> >I don't have to have 10 disks in the same coputer at the same time. Then 
> >what, hot swap? Well this is very much possible, and secure (look at 
> >Promise.com).
> >IDE disk drives are very cheap and fast enough (Maxtor 160GB has a write 
> >performance of about 35MB/s in average) for most purposes and does not 
> >require special hardware or software.
> Well... let's consider all aspects.  I'm a sysadmin the kind of BOFH, so 
> late in the evening I usually find myself a bit overloaded on beer. 
> Specially on friday, if I have to stay at work past 5PM I have the 
> irresistible temptation to go to the closet and piss*1 on the diskcabbinet.

    Good way to guarentee you won't have kids. 
    
> For a backup policy you *must* take appart the media from the on-line 
> data to be protected.  Having all your backup media in a single place is 
> *BAAAAAAAD* idea (TM).

    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.
    Depends on your needs.

    I have one database that changes fast enough that if it's 36 hours
    old, we're basically just recovering it for the table structures. 

    I've got another one that changes fast enough that it's not worth
    backing up. If it's more than 2 hours old, starting from scratch is
    fine. 

    It the first case, off site backups don't make sense, so we have 2
    backup hosts (seperated by about 10 feet currently, less in a day or
    two) that get backups on an alternating (daily) basis. 

    Oh, this is in addition to these databases being replicated pairs. 

    Again, your backup strategy depends on your needs, your budget, and
    your risk tolerance. 

    It doesn't make sense to spend $10k for a backup solution for $20k of
    data. It does make sense to spend $10k to backup $100k.  

> Now, start moving from the cabinet to the in-place closet your disks one 
> day and another, and to the off-site closet at least once a month, and 
> tell me you won't need to replace your disks on a shorter basis than 
> your DTLs or DDSs.


> 
> *1: Standard dramatization in place.  I *don't* do that (specilly true 
> if my boss is reading this article X^D  )

    No, but a handful of metal filings are (1) more effective, (2) less
    traceble, and (3) less likely to get your pecker arced off. 

-- 
Share and Enjoy. 
