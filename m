From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Spinning down/up drives.
References: <12639997890.20020602023603@tnonline.net> <20020602014851.A15117@zealot.blacknet.de>
In-Reply-To: <20020602014851.A15117@zealot.blacknet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E17EQ6p-0003ep-00@hermes.sistina.com>
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
Date: Sun Jun  2 02:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2 Jun 2002 09:48, you wrote:
> I can not tell who is handling it grecefullt, but I've 6x80GB Maxtor
> drives, two on one primise controller. I'm running a RAID5 with this
> drives (linux softraid, aka MD, kernel 2.4.18) with LVM 1.0.x ontop.
> The LVs are either running ext3 or ReiserFs.
> The discs are configurated to spindown after 25min of idle time
How have you managed to do this?  Is this a Maxtor feature? or some driver(s) 
for Linux?  I've been wanting to do exactly this for some time but have not 
been able to...  Any pointers or info would be appreciated.

 and
> beside some "IDEx resetting drive" error messages the system is stable
> since about 6 months (the time I assembled it).
> It's only my home server, but you don't want to have production/work
> machines spinup their drives first.
All depends.  On the RAID5 I have running at work & home I have a hot-spare & 
I have a hdparm -y /dev/hdg in rc.local which puts it to sleep after boot-up 
as its useless having it spin if its not needed.  NOTE: I have never been 
able to get hdparm -Y /dev/hdg working on any drive even those that are 
suppost to support it.  Again any pointers or info would be appreciated.

-- 
Adrian Head

(Public Key available on request.)
