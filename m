From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130093656.C18867@colombina.comedia.it>
References: <Pine.LNX.4.21.0111291704550.435-100000@sol.rune.org> <NBBBKLKHMJHIJLHOGAOJMEDIJCAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJMEDIJCAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Fri, Nov 30, 2001 at 11:45:24AM +1300
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
Date: Fri Nov 30 02:35:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 11:45:24AM +1300, Steve Wray wrote:
> Sounds to me like Linux is a sort of in-betweeny here!
> 
> I assume that its possible to boot HP-UX and AIX machines
> from their 'rescue' media and have full and easy access
> to the LVM structure?

HP does have 2 methods

a lvm maint mode where lvm is not activated and root is statically mapped in
kernel (there is some long mails between me and someone else in the archives
discussing it in depth).

an install/rescue media that can be used to do lvm mainteinance

with mandrake rescue media you should be able to do lvm mainteinance (but
mandrake rescue media has other bugs....)

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
