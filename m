Subject: Re: [linux-lvm] lvm-1.0.1 not working with DAC960/2.2.20
Message-ID: <20011128160908.A792@btconnect.com>
References: <wvbshoy54w.fsf@freeze.oslo.dnmi.no> <20011127111424.A8179@sistina.com> <20011127102808.A730@lynx.no> <20011128080052.B434@btconnect.com> <20011128091727.P730@lynx.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011128091727.P730@lynx.no>; from adilger@turbolabs.com on Wed, Nov 28, 2001 at 09:17:27AM -0700
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
Date: Wed Nov 28 10:55:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas,

On Wed, Nov 28, 2001 at 09:17:27AM -0700, Andreas Dilger wrote:
> Any objection to me digging out my changes to pv_read_all_pv_of_vg()
> and friends and cleaning that lot up?  That was the source of the
> other problem that Lars had, and it has been nasty for a long time.

That would be most welcome, but can you post to the lists when your
code in CVS is ready for testing please (maybe use a tag) ?  I'm
worried that some changes (by all of us) aren't getting tested much
before they suddenly appear in a release.

- Joe
