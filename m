Date: Fri, 31 Aug 2001 13:47:17 +0100
Subject: Re: [linux-lvm] Why aren't the linux-sources up to date?
Message-ID: <20010831134717.A585@btconnect.com>
References: <OF41C775E9.837668B1-ONC1256AB9.002E0C80@gillette.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF41C775E9.837668B1-ONC1256AB9.002E0C80@gillette.com>; from Daniel_Schroeter@gillette.com on Fri, Aug 31, 2001 at 10:31:07AM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 31, 2001 at 10:31:07AM +0200, Daniel_Schroeter@gillette.com wrote:
> Hi LVM-team,
> we're testing the LVM in the company. I using the kernel 2.4.9. Why don't
> have the sources from the linux-kernel the current LVM version (1.0.1)? I
> need to patch the sources with your makefile. Yes, it works fine :-)
> 
> I writing a articel for the company, so I need the information why, the
> current linux kernel, doesn't have the newest LVM version.
> Thank's for a answer of this question.

Good question.  

Alan Cox has integrated patches up to Beta 7.  Currently he's waiting
for me to send the final patch set which will bring him up to date with
1.0.1, I'm waiting until I'm confident the changes are correct.

Linus' kernels contain beta2 level code.  I can only assume that Alan
has pushed the patches forward to Linus and they have been rejected.
There *are* issues with the driver, regarding the ioctl interface
among other things.  But in the short term I feel it would be better
if Linus were to accept the patches from Alan since beta2 was quite
broken.

- Joe
