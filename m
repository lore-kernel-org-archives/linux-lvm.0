From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Directory becomes sticky socket?
Message-Id: <20020205110759.C30823@sistina.com>
References: <20020204154410.GA14373@wookimus.net>
MIME-Version: 1.0
In-Reply-To: <20020204154410.GA14373@wookimus.net>; from
    chewie@wookimus.net on Mon, Feb 04, 2002 at 09:44:10AM -0600
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
Date: Tue Feb  5 04:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Chad,

check for processes having the socket open, stop them and retry.
An optional "chmod o-t /usr/share/doc/libldap2" may be necessary.

On Mon, Feb 04, 2002 at 09:44:10AM -0600, Chad C. Walstrom wrote:
> [Note: Please include me in the Cc: of your reply, for expediency's sake.]
> 
> I'm not sure how this came about, but I cannot remove the directory
> /usr/share/doc/libldap2.   
> 
>     [09:36:47] chewie@skuld (505)$ ls -lad libldap2 
>     s-w--w---T  16806 236536206 1076048101 1084824775 Oct  1  2004 libldap2=
>     [09:36:52] chewie@skuld (506)$ file libldap2
>     libldap2: sticky socket
>     [09:36:58] chewie@skuld (507)$ sudo rm -rf /usr/share/doc/libldap2
>     rm: cannot unlink `/usr/share/doc/libldap2': Operation not permitted
> 
> System: Debian unstable (Sid)
> Kernel: 2.4.17-k7
> Filesystem: ext3 on an LVM logical volume (no extra patches to the
> kernel, vanilla 2.4.17).
> 
> I've tried removing it while root as well with no success.  I've tried
> using fsck.{ext2,ext3} with no avail.  I relize that I'm going to have
> to do something fairly low-level to the FS to recover this problem.  Any
> pointers or suggestions you may have would be quite welcome.
> 
> Thanks.
> 
> -- 
> Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
> http://www.wookimus.net/                            | s.k.a. gunnarr
> Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)



-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
