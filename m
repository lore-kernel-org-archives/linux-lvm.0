From: Tim <tim@connectlive.com>
Subject: Re: re[2]: [linux-lvm] System Suggestions
Message-Id: <20020307095732.A27082@connectlive.com>
References: <auto-000020233424@front1.mail.megapathdsl.net>
    <Pine.BSI.4.10.10203070728480.16043-100000@xs3.xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.BSI.4.10.10203070728480.16043-100000@xs3.xs4all.nl>;
    from knuffie@xs4all.nl on Thu, Mar 07, 2002 at 07:32:29AM +0100
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
Date: Thu Mar  7 08:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Don't use raid5. I always use a combination of raid 1 and 10 for a
> database server. If you have a database that frequently updates records
> you don't want the extra write overhead.

Yeah, what he said.  However it is sometimes possible to get decent
performance anyways from a hardware RAID5 device if the controller has
enough cache (ie. a LOT).  Generally speaking the Oracle "suggested
layouts" for disks consist of 17-22 spindles, mirrored, with logical
splits among the write-ahead log, the data area, and the redo log...

Boy do I ever Not Miss working with Oracle.


-- 
     "To be suspended from the legal profession is the moral equivalent of 
      being ostracized by child molesters."
                                                           --Ian Rowan
