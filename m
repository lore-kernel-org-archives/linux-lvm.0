From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] resize LV online
Message-ID: <20040105134102.GA1243@tykepenguin.com>
References: <200401051531.58176.gangwang@redflag-linux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200401051531.58176.gangwang@redflag-linux.com>
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
Date: Mon Jan  5 07:42:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 05, 2004 at 03:31:58PM +0800, wanggang wrote:
> does anyone know any safe way to resize(enlarge/reduce) a mounted(online) LV 
> besides ext2online?
> 

Not for ext2/3. Try using a different filesystem that allows online resizing
(such as reiserfs or XFS)

-- 

patrick
