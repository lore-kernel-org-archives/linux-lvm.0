Subject: Re: [linux-lvm] Cluster LVM
Message-Id: <20020228113040.GA1898@fib011235813.fsnet.co.uk>
References: <200202281024.LAA26544@mailgate.sara.nl>
    <20020228105951.26555.qmail@web13004.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020228105951.26555.qmail@web13004.mail.yahoo.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Feb 28 05:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 02:59:51AM -0800, Prashant Kharche wrote:
> When tools are run they run with a lock
> and and at that time the filesystem cannot access the
> volume groups.

How are you preventing remote nodes from accessing the volume groups ?
Or are you working on an 'offline' solution, where there can be no
users of logical volumes while you resize them ?

- Joe
