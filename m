From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <20020207131906.GA8259@auctionwatch.com>
References: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
    <3C62423D.1000308@promofinarsa.es>
    <20020207091636.GD5188@auctionwatch.com>
    <3C625820.6040807@promofinarsa.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C625820.6040807@promofinarsa.es>
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
Date: Thu Feb  7 07:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 07, 2002 at 11:34:08AM +0100, Jesus Manuel NAVARRO LOPEZ wrote:
> Hi, Petro:
> Petro wrote:
> >On Thu, Feb 07, 2002 at 10:00:45AM +0100, Jesus Manuel NAVARRO LOPEZ wrote:
> [...]
> >>Well... let's consider all aspects.  I'm a sysadmin the kind of BOFH, so 
> >>late in the evening I usually find myself a bit overloaded on beer. 
> >>Specially on friday, if I have to stay at work past 5PM I have the 
> >>irresistible temptation to go to the closet and piss*1 on the 
> >>diskcabbinet.
> >    Good way to guarentee you won't have kids. 
> Fair enough.  I *don't* have childrens... but I tend to consider my PFY 
> like a bastard of my bastardness, does it counts?
    
    That was intended to be humorous. Urinating on live electrical
    components tends to be a shocking experience.

> >>For a backup policy you *must* take appart the media from the on-line 
> >>data to be protected.  Having all your backup media in a single place is 
> >>*BAAAAAAAD* idea (TM).
> >    Depends on your needs.
> Yes: depends on my needs: If I need to recover any data, having *all*
> your backup media in a single place is *BAAAAAAAD* idea (TM).  If this 

    No, when you need to recover stuff, it's a *great* idea to have it
    in one place.

    When you suffer an environmental calamity, it's a bad idea. 

> place is the same (or near to) the place where the production data is 
> stored is simply unadjectivable.

    Ever tried to push tens of gigabytes over a WAN? 

> >    Depends on your needs.
> >    I have one database that changes fast enough that if it's 36 hours
> >    old, we're basically just recovering it for the table structures. 
> In case of disaster, if your backup media is in the proximities of your 
> production database (define "proximities" as needed) you won't be able 
> to recover table structures.  One thing is what I say, and a *completely 
> different* issue is to decide *what* to backup, and how, not where.

    That wasn't my point. 

    My point was that for some stuff, 36 hour old data is useless, and
    even a normal tape rotation schedule can put data out of reach for
    10 or 12 hours minimum. 

> >    I've got another one that changes fast enough that it's not worth
> >    backing up. If it's more than 2 hours old, starting from scratch is
> So, the amount of change by unit time is your key to decide what you 
> *need* to backup and what you don't?
> Sound *extremly* odd to me.  I would say it should be *the value* of the 
> material (this include the cost to recreate it anew too, obviously), not 
> its change rate.

    Not the necessity of backing up, but the cost. If the data is
    changing that fast, it could easily be that by the time it's on
    tape, it's out of date and effectively useless. 

> >    It the first case, off site backups don't make sense, so we have 2
> >    backup hosts (seperated by about 10 feet currently, less in a day or
> >    two) that get backups on an alternating (daily) basis. 
> They won't make sense deppending on its *cost*, not its change rate.

    No, it would be a lot cheaper to dump the dbs to tape, and carry the
    tapes offsite, but (1) recovery time is almost tripled, and (2) 
 
> >    Oh, this is in addition to these databases being replicated pairs. 
> 
> This doesn't add nothing to value your backup strategy.  Again the value 
> is the key.  You have replicated in pairs, do you?  What then in case of 
> fire on you operations center?  I'd bet you'll loose both of your servers.

    In case of fire in the colo, we lose the entire site. Then there is
    nothing to recover the data onto. 

    And yes, we know the problems with this. It's a calculated risk. We
    can't afford geographically seperated facilities right now. 

> >    Again, your backup strategy depends on your needs, your budget, and
> >    your risk tolerance. 
> >    It doesn't make sense to spend $10k for a backup solution for $20k of
> >    data. It does make sense to spend $10k to backup $100k.  
> 
> Of course.  Your backup strategy surely deppends... *on the data value* 
> and only on this.  From the very beginning I stated that for "home data" 

    No, it doesn't. It depend on several things:

    (1) Value of data. 
    (2) Cost of downtime. 
    (3) Rate of change. (If your data set is completely worthless after
    24 hours, but worth several million for the first hour, offsite
    backups don't necessarily make sense etc.) 

    And probably some more I haven't thought of. 

-- 
Share and Enjoy. 
