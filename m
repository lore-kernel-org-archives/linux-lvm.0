Subject: Re: [linux-lvm] FS resize
References: <E04CF3F88ACBD5119EFE00508BBB212102320AB5@exch-01.noida.hcltech.com>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <E04CF3F88ACBD5119EFE00508BBB212102320AB5@exch-01.noida.hcltech.com>
Message-Id: <wvu1qqfmx1.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
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
Date: Fri Apr  5 04:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Chitaranjan" == Chitaranjan Behera, Noida <cbehera@noida.hcltech.com> writes:

    Chitaranjan> Hi,

    Chitaranjan> Using LVM1 how can I resize a JFS file system ?

I don't think you can currently; extendfs doesn't do anything yet
(ie. this is a JFS problem, not a LVM problem),

A simple work around, create a new LVM of the size you want, mount it
and copy the contents from the old one to the new one :-)

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
