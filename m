From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] device-mapper ioctl cmd 2 failed: Invalid argument
References: <20030920185757.A9590@copilotconsulting.com> <20030923131147.P2155@uk.sistina.com>
In-Reply-To: <20030923131147.P2155@uk.sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200309230924.44185.kevcorry@us.ibm.com>
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
Date: Tue Sep 23 12:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Alasdair G Kergon <agk@uk.sistina.com>, Joe Thornber <thornber@sistina.com>

On Tuesday 23 September 2003 07:11, Alasdair G Kergon wrote:
> On Sat, Sep 20, 2003 at 06:57:57PM -0700, Tracy R Reed wrote:
> > I think I've got the latest everything:
> > home:~# lvdisplay --version
> >   Driver version:  1.0.6
> >
> > I've got the latest 2.6, the latest devmapper, the latest lvm userland
> > tools from sistina... But snaps still don't work.
>
> Firstly, there's some versioning mix-up here, because the driver
> in the 2.6 kernels is not 1.0.6.

Actually, if he didn't select the "ioctl interface version 4" option in the 
kernel config, it will be version 1.0.6.

Do we think the v4 interface has now gotten enough testing to remove the v1 
stuff from 2.6? :)

-- 
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/
