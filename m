Subject: Re: [linux-lvm] Differences between LVM1 and LVM2
References: <3DDA963B.7080309@crepido.com> <20021121120126.C8329@sistina.com>
From: Samuli Suonpaa <suonpaa@iki.fi>
In-Reply-To: <20021121120126.C8329@sistina.com> ("Heinz J . Mauelshagen"'s
 message of "Thu, 21 Nov 2002 12:01:26 +0100")
Message-ID: <878yznyxot.fsf@puck.erasmus.jurri.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Thu Nov 21 05:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" <mauelshagen@sistina.com> writes:
> We still declare LVM2 to be in Beta _because_ it misses the soon to
> be added feature to online relocate data (pvmove).

How about documentation? I still haven't seen any documentation that
would really give me a change to _understand_ what's the relation
between DM and LVM2 or how I should set up my system. Something
similar to LVM-HOWTO, I mean.

Should I do most things just like I'm used to with LVM tools
(pvcreate, vgcreate, lvcreate and then just mount) or should I use
dmsetup for something - and for what?

Oh, and now that I'm already writing this on the list, I might as well
ask a few questiong about used and usable versions as well.

My laptop and my home-server are both running Debian Testing. Packages
lvm2-1.95.10-2 andf dmsetup-0.96.04-2 and libdevmapper0-0.96.04-2 are
available, both packaged by Andres Solomon. I guess I'd have to
install these? Will these work with - for instance - kernels
2.4.20-rc1-ac4 and 2.5.47-ac6 or should I patch my kernels?

Suonp��...
