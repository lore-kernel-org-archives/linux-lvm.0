Subject: Re: [linux-lvm] OK...interesting dilemma... 
In-Reply-To: Your message of "Thu, 01 Nov 2001 21:21:19 MST."
             <20011101212119.S16554@lynx.no> 
References: <20011102022256.536AC182DE@skuld.wookimus.net>  <20011101212119.S16554@lynx.no> 
From: "Chad C. Walstrom" <chewie@wookimus.net>
Message-Id: <20011102131633.965D8180A6@skuld.wookimus.net>
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
Date: Fri Nov  2 07:19:02 2001
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

In message <20011101212119.S16554@lynx.no>, Andreas Dilger writes:
> Did you vgexport that VG?  If so, when you vgimport it you can give it
> a new name.

DOH!  I don't know what I was thinking.  Thanks for the help.  I'll have
to do some interesting re-swaping of hardware, then. ;-)

> > Will it correctly choose the inactive volume?
> 
> Probably not if you use vgrename.

Thanks for the heads-up!

--
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint = B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD
