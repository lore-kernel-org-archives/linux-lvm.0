Return-Path: <thornber@btconnect.com>
Date: Wed, 15 Aug 2001 08:48:19 +0100
Subject: Re: [linux-lvm] VGscan and CDROM devices
Message-ID: <20010815084819.D254@btconnect.com>
References: <3B7A240E.6090006@lvcm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B7A240E.6090006@lvcm.com>; from warl0k@lvcm.com on Wed, Aug 15, 2001 at 12:26:06AM -0700
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

On Wed, Aug 15, 2001 at 12:26:06AM -0700, Glenn Shannon wrote:
> Hi all.
> 
> At boot, there is a good 20 second pause while vgscan runs because it 
> tries to scan the CD drive.
> 
> Is there a way to stop this?

Not at the moment.  AJ's currently writing some code that will allow you 
specify which devices to scan in the config file.

> Also, interesting note: If it scans the CD and there is data on it the 
> vgchange errors out saying it can't find the names of the devices....

I've also noticed it stopping any music CD's that are playing.

- Joe
