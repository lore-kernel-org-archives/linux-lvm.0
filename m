From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Linux 2.4.20 devmapper + userland utilities issue
Message-ID: <20030105205306.A6754@uk.sistina.com>
References: <20030105090400.1d4e61be.david@eelf.ddts.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030105090400.1d4e61be.david@eelf.ddts.net>; from david@eelf.ddts.net on Sun, Jan 05, 2003 at 09:04:00AM -0500
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
Date: Sun Jan  5 14:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 05, 2003 at 09:04:00AM -0500, David B Harris wrote:
>   Aborting. Failed to wipe snapshot exception store. Remove new LV and
> retry.
I've glanced at the code and the error message here is misleading: I'll
change it.

The error occurred when it was trying to use device-mapper to activate 
the new LV for the first time.  (The LV already exists in the VG metadata 
at this point.)
 
> Hopefully the log isn't too much. :) 
I can't see it - please email the full debug log(*) from the lvcreate
directly to me and I'll investigate on Monday.

Also send the version numbers: 
  lvcreate --version

Alasdair
-- 
agk@uk.sistina.com

(*) e.g. run with -vvv and capture all output incl. stderr, or use 
following config file section and send /tmp/lvm2.log

  log {
          file="/tmp/lvm2.log"
	  level=6
  }
