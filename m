From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] Device Mapper Patches
References: <3EB7C6B8.8010506@gmx.at> <20030506144132.GH433@fib011235813.fsnet.co.uk>
In-Reply-To: <20030506144132.GH433@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200305061346.14605.kevcorry@us.ibm.com>
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
Date: Tue May  6 13:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Joe Thornber <thornber@sistina.com>

On Tuesday 06 May 2003 09:41, Joe Thornber wrote:
> On Tue, May 06, 2003 at 04:29:12PM +0200, kihan wrote:
> > hello,
> >
> > i got a reply, that evms2 and lvm2 will operate on the same
> > device-mapper interface, if some patches from the evms team are merged
> > into the device-mapper source (for running on 64 bit architectures).
> >
> > what is the state about this?
>
> If they submit them to me and I like them they'll get merged (as they
> have been doing for a while).  My pending patches directory is empty
> ATM, so if I've been lax and overlooked them they'll need to send them
> again.

He is referring to the ioctl interface changes. I mentioned that you are still 
in the process of reviewing/testing, and that they will be included in a 
future device-mapper release.

-- 
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/
