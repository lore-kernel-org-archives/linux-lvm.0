From: Shane Wegner <shane@cm.nu>
Subject: Re: [linux-lvm] Recovering inconsistent vg
Message-ID: <20020605223342.GA29203@continuum.cm.nu>
References: <20020605003728.GA3783@continuum.cm.nu> <20020605123903.GH1061@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020605123903.GH1061@tykepenguin.com>
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
Date: Wed Jun  5 17:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jun 05, 2002 at 01:39:03PM +0100, Patrick Caulfield wrote:
> On Tue, Jun 04, 2002 at 05:37:28PM -0700, Shane Wegner wrote:
> > vgscan -- ERROR "lv_check_consistency(): LV status" volume
> > group "vg0" is inconsistent
> 
> If this is a recent debian unstable upgrade then you should get
> the latest 1:1.0.4-4 deb (uploaded this morning GMT) that fixes 
> the problem.

Yes, that was it.  Thank you for the help.

Shane
