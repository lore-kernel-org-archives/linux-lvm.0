From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] determing lvm support
Message-ID: <20031220233051.I21022@uk.sistina.com>
References: <1071881237.1464.14.camel@rich> <20031220123023.H21022@uk.sistina.com> <20031220133541.GF24434@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031220133541.GF24434@percy.comedia.it>; from bluca@comedia.it on Sat, Dec 20, 2003 at 02:35:41PM +0100
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
Date: Sat Dec 20 17:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Dec 20, 2003 at 02:35:41PM +0100, Luca Berra wrote:
> Besides that is there any way to reliably check if dm is loaded from a
> c program, besides calling dm_task_run(), which is noisy if the driver
> is not loaded? I don't want the user to see an error if she's not
> running device-mapper.

Look at using dm_log_init() to provide a function that
suppresses all output.

> it the moment i try to open dm_dir()/control, is that ok?
That should work OK bypassing libdevmapper.
Otherwise, try dm_task_get_driver_version() after disabling log output.
 
Alasdair
-- 
agk@uk.sistina.com
