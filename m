Return-Path: <laird@internap.com>
Date: Fri, 12 Jan 2001 13:41:02 -0800 (PST)
From: Scott Laird <laird@internap.com>
Subject: Re: [linux-lvm] hard drive shock tolerance
In-Reply-To: <0101130551570E.27982@lyta>
Message-ID: <Pine.LNX.4.21.0101121331460.13252-100000@lairdtest1.internap.com>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: zoo1@corecomm.net


On Sat, 13 Jan 2001, Russell Coker wrote:
> Given a choice I prefer hard drives with lower rotational speeds because of 
> the lesser heat production.  Read the spec sheets and you'll see that as a 
> general rule 10K rpm drives use twice as much power as 7200 rpm drives, twice 
> the power == twice the heat!

Hmm.  Seagate's current 9GB 7200 RPM drive, the ST39236LC draws 7W when
idle.  Their current 9 GB 10k RPM drive, the ST39204LC draws 8.5W when
idle.  IMHO, that's not really very significant anymore, especially when
your CPU eats 20-70W.  Both of these numbers are way better then drives
only a generation or two back -- last year's ST39175 (9 GB, 7200 RPM) drew
9.75W when idle.


Scott
