From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] can't use all VG free space for an LV stripe
Message-ID: <20020531072248.GC1145@tykepenguin.com>
References: <0d3e01c206d0$7fc1b280$070414ac@Home.PIN.LU> <20020530180012.95991.qmail@web10102.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020530180012.95991.qmail@web10102.mail.yahoo.com>
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
Date: Fri May 31 02:23:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, Vahid Pazirandeh <vpaziran@yahoo.com>

On Thu, May 30, 2002 at 11:00:12AM -0700, Vahid Pazirandeh wrote:
> hi Christian,
> 
> does this imply that all PV sizes in a VG must have the same size if i want to
> stripe along all of them, thus using 100% of the VG space?

If you have 2 PVs in a striped LV then the maximum size of the LV is the size of
the smallest of those PVs. 

If the two PVs are of different sizes you can still use the remaining space in
the larger of the two for another (non-striped) LV.
 
-- 

patrick
