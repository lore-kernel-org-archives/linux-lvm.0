From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: Bug#150005: LVM does not fscking work at all
Message-ID: <20020617065802.GB1177@tykepenguin.com>
References: <20020614223602.A20065@verso.st.jyu.fi> <20020615090126.GA1173@tykepenguin.com> <20020615134314.A8160@verso.st.jyu.fi> <20020615110941.GA1663@tykepenguin.com> <20020615141843.A9586@verso.st.jyu.fi> <20020615114712.GA1794@tykepenguin.com> <20020615150026.A10954@verso.st.jyu.fi> <20020615122045.GA1926@tykepenguin.com> <20020617014818.A11995@verso.st.jyu.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020617014818.A11995@verso.st.jyu.fi>
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
Date: Mon Jun 17 01:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Juhapekka Tolvanen <juhtolv@st.jyu.fi>

On Mon, Jun 17, 2002 at 01:48:18AM +0300, Juhapekka Tolvanen wrote:
> 
> On Sat, 15 Jun 2002, +15:20:46 EEST (UTC +0300),
> Patrick Caulfield <patrick@debian.org> pressed some keys:
> 
> > On Sat, Jun 15, 2002 at 03:00:26PM +0300, Juhapekka Tolvanen wrote:
> 
> > > Maybe I should create a brand new .config with a little help from those
> > > aforementioned screenshots. And after that I should always use that
> > > "make oldconfig".
> 
> > That might be a good thing to do. Make sure you do a "make mrproper"
> > first to really clean out the source tree.
> 
> > copying a .config and doing "make oldconfig" is what I do most of the
> > time but sometimes you do need to do mrproper.
> 
> It still does not fscking work! I did this:
> 
> I took fresh sources of kernel 2.4.18 and unpacked them. Then I
> installed these patches:
> 
> patch-2.4.19-pre10
> patch-2.4.19-pre10-ac2
> preempt-kernel-rml-2.4.19-pre10-ac2-1.patch
 
That /proc/devices is *still* wrong - until there's a resonable set of devices
in there LVM hasn't ahope of working. Take out all the patches and try a
"normal" kernel.

...oh, and please stop spamming everyone with your problem. It's neither an LVM
kernel nor a LVM userspace issue - simply that your kernel builds are broken.

patrick
