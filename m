Subject: Re: [linux-lvm] which filesystem to use on slackware
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20040110000045.98531.qmail@web80403.mail.yahoo.com>
References: <20040110000045.98531.qmail@web80403.mail.yahoo.com>
Message-Id: <1073693715.30384.6.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Jan  9 19:26:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm <linux-lvm@sistina.com>

On Fri, 2004-01-09 at 19:00, Chris Conn wrote:
> Hi, I'm running slackware 9.1, have a dual-boot Win98/Slack
> machine and I've just added a 60GB HD. I'm using 50GB of that
> for Windows (kid games :-)) and 10GB for Linux, have formatted
> it as EXT2 but now I'm thinking of trying one of the journaled
> file systems, reiserfs or IBM's JFS or EXT3. I haven't used
> that new partition yet.
> 
> My Slackware system is EXT2 on the original HD.
> 
> I work in AIX support at IBM (systems performance, mainly) and
> I'm thinking this will be a good opportunity to learn more 
> about the LVM at home. Is there one of these journaled file
> systems that you all would recommend over the other? I'm not
> sure how I'm going to convert to the new filesystem, although
> I should be able to make the filesystem on the new HD whatever
> I want, so I'm halfway there.
> 
> Thanks for any advice,
They seem to all have their unique pros and cons.

I don't think any of them are 'the best'.

ext3 seems to be the most solid from what I read, but not great for
performance.

reiserfs is great for lots of small files.  It was tuned for news
servers.

xfs is great at delivering streaming video.

I don't know anything about jfs.

I chose xfs 2 years ago as my filesystem of choice because I assumed it
would be the most rock solid due to the SGI support.  That has not been
true, but the current XFS 1.3.1 seems to work pretty well.

Maybe there is a wiki somewhere that talks about the pros and cons. If
not, there really should be.

Greg
-- 
Greg Freemyer
