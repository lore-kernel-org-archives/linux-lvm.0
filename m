From: Sarwer Zafiruddin <sarwer.zafiruddin@rune.org>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org>
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
Date: Thu Nov 29 15:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Expanding / is useful when you need to upgrade the system and the newer OS
needs more space to upgrade.  My primary concern is things under the /var
filesystem, where things grow constantly like logs (which I like to keep
atleast 6months of rotated logs), possibly more space for
/var/spool/mqueue (for mail server that have increase of mail traffic),
and /var/spool/mail (for those hog user who refuse to clean up their INBOX
;-) ).

Sarwer

> > (b) dynamically expand the amount of space available to the root
partition.
> 
> Pardon me for being a neophyte here, but what else goes on the root
> partition which takes any significant or dynamic amount of space?  Isn't
> the root just a place to put all the top level directories, the contents
> of which are typically all on another partition anyway?
> 
> -- Mitch

-- 
--------------------------
System Administrator
Rune Information Services
http://www.rune.org
e-mail:  sarwer@rune.org
--------------------------
