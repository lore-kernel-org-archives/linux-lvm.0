From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: imposs mount vg
Message-ID: <20020513220225.GC17739@colombina.comedia.it>
References: <3CE036C7.21A968F@club-internet.fr>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3CE036C7.21A968F@club-internet.fr>
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
Date: Mon May 13 17:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Mon, May 13, 2002 at 11:57:27PM +0200, Adeline M�tayer wrote:
> Yes, I did a
> vgscan
> vgchange -a y
> 
> 
> All is all right. The problem is that Linux asks the fs type for the
> mount command :
> [root@localhost root]# mount /dev/mon_volume_groupe/lv1 /mnt/
> mount : vous devez indiquer le type de syst�me de fichiers.
>         ===> (that is to say, in english : "you should type the fs
> type".

not wanting to offend, but
did you actualy create a filesystem?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
