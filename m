From: Lewis Bergman <lbergman@abi.tconline.net>
Subject: Re: [linux-lvm] getting started with LVM
References: <3CED546C.2000401@jumpline.com> <40970000.1022186992@duke> <3CED5725.8070006@jumpline.com>
In-Reply-To: <3CED5725.8070006@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200205231558.20237.lbergman@abi.tconline.net>
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
Date: Thu May 23 16:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thursday 23 May 2002 03:55 pm, Ben Snyder wrote:
> Something I probably should have mentioned....due to some software we
> use to serve our customers, we have hard links - TONS of them.  We
> looked at cpio, but cpio does not restore hardlinks correctly, dump
> will.  We also looked at tar, 'star', dd, just about anything to take
> the data from one device/filesystem to another.
Have you considered using cp -aux? It should restore hardlinks.
-- 
Lewis Bergman
Texas Communications
4309 Maple St.
Abilene, TX 79602-8044
915-695-6962 ext 115
