From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Re: After power outtage my vg is gone
Message-ID: <20011101141945.G16554@lynx.no>
References: <002e01c161d6$7fa8a960$0a5c010a@ultra> <20011030235208.F800@lynx.no> <005801c161dc$1bbd6160$0a5c010a@ultra> <001501c16305$0e2ab230$0a5c010a@ultra> <20011101195430.B23396@bunuel.tii.matav.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011101195430.B23396@bunuel.tii.matav.hu>; from mag@bunuel.tii.matav.hu on Thu, Nov 01, 2001 at 07:54:30PM +0100
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Nov  1 15:18:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Nov 01, 2001  19:54 +0100, Magos=E1nyi =C1rp=E1d wrote:
> Another item which needs inclusion is the bit about restoring the
> uuid. I think of that little perverse 'dd' commands which should
> be done with pw_uuidlist_on_disk.base.

This is now handled by the "uuid_fixer" commands, which are included
in the LVM CVS, I think (I don't know if it is installed).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
