Subject: Re: [linux-lvm] NEED HELP ON VGDA!!
Message-Id: <20020108024549.A1011@btconnect.com>
References: <20020105170323.M12868@lynx.no>
    <20020108174903.23381.qmail@web13003.mail.yahoo.com>
    <20020108113147.G769@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020108113147.G769@lynx.adilger.int>; from
    adilger@turbolabs.com on Tue, Jan 08, 2002 at 11:31:47AM -0700
From: Joe Thornber <thornber@btconnect.com>
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
Date: Wed Jan  9 03:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 08, 2002 at 11:31:47AM -0700, Andreas Dilger wrote:
> On Jan 08, 2002  09:49 -0800, Prashant Kharche wrote:
> >          Im working on the LVM.. I want to know the
> > VGDA structure.. and how it is stored on the PVs. If
> > anyone has the documentation of the VGDA please
> > forward it to me..
> 
> include/linux/lvm.h

or checkout LVM2 from cvs and read the code in lib/format1, paying
particular attention to disk-rep.h.

- Joe
