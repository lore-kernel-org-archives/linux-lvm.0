From: GCS <gcs@lsc.hu>
Subject: Re: [linux-lvm] Kernel 2.4.12 bug?
Message-ID: <20011025084333.C8281@lsc.hu>
References: <B45465FD9C23D21193E90000F8D0F3DF0178FF82@mailsrv.linkvest.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF0178FF82@mailsrv.linkvest.com>; from Jean-Eric.Cuendet@linkvest.com on Wed, Oct 24, 2001 at 09:20:26AM +0200
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
Date: Thu Oct 25 01:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 24, 2001 at 09:20:26AM +0200, Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com> wrote:
> I also have problems with 2.4.12 + LVM rc4. I have a kernel panic with a
> "stack trace" in the kernel *before* it mounts ROOT.
> Any idea? Everything works fine with 2.4.7 / 2.4.9
 I am using rc2. Anyway, try with 2.4.13. Ooops are gone, only 'buffer is
busy' remains, but as Patrik (?) wrote, this is harmless.

GCS
