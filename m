From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] LVM
Date: Wed, 12 Sep 2001 12:07:41 -0400
References: <NBBBJHKIOKPKOGOEPEDPKEDNDNAA.stuart@bh90210.net> <3B9F4B72.9050801@st-peter.stw.uni-erlangen.de> <3B9F66BE.DFE69112@carolina.rr.com>
In-Reply-To: <3B9F66BE.DFE69112@carolina.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010912160743.5D20E4326@oscar.casa.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Jason Edgecombe <jedgecombe@carolina.rr.com>

On September 12, 2001 09:44 am, Jason Edgecombe wrote:
> hi,
>
>   I must ask what filesystem /boot is using. If you're using reiserfs,
> then you MUST mount with the "notail" option for /boot. If you're using
> ext2 of reiserfs with "notail" then I would recommend the you move /boot
> to before the 1024th cylinder. (I like to always put /boot at the
> beginning of the drive.)
>
> Sincerely,
> Jason Edgecombe

This used to be true.  Recient versions of lilo understand reiserfs tails, so you 
can mount with tails IF you have an up to date LILO.

Ed Tomlinson
