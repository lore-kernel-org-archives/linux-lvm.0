From: Joachim Banzhaf <jbanzhaf@ngi.de>
Subject: Re: [linux-lvm] LVM1 on top of DRBD
References: <200308201141.20079.jbanzhaf@ngi.de> <200308201354.36936.jbanzhaf@ngi.de> <20030820153151.D8426@sistina.com>
In-Reply-To: <20030820153151.D8426@sistina.com>
MIME-Version: 1.0
Message-Id: <200308201648.38776.jbanzhaf@ngi.de>
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Lq4Q/ZxMONyFQNz"
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
Date: Wed Aug 20 17:35:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-00=_Lq4Q/ZxMONyFQNz
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Mittwoch, 20. August 2003 15:31 schrieb Heinz J . Mauelshagen:
> On Wed, Aug 20, 2003 at 01:54:36PM +0200, Joachim Banzhaf wrote:
> > Am Mittwoch, 20. August 2003 12:46 schrieb Heinz J . Mauelshagen:

> > > DRBD devices are just some other "local" ones for it.
> >
> > OK, but as i stated, I used them that way. LVM1 just seems to use the
> > lower level devices drbd works on instead. That's what's bothering me.
>
> Ah, missed that point :(
> LVM2 is your better option because it supports device name filters
> in a config file rather than hard-coded ones.

Well, I guess I have to - and hope for the best. Since I thought I had that 
filter implemented in LVM1 (see attached patch) and that did not work, my 
expectations aren't too high...

> > Again, to clear the ground: Should it be possible at all to use pv's on
> > top of drbd devices or am I forced to use drbd devices on top of lv's and
> > loose things like online resize feature?
> >
> > Have you - or anybody reading the list - ever sucessfully used that
> > scenario?
>
> I don't. List ?





--Boundary-00=_Lq4Q/ZxMONyFQNz
Content-Type: text/plain;
  charset="iso-8859-1";
  name="lvm-ignoredevs-v1.patch.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="lvm-ignoredevs-v1.patch.txt"

--- LVM/1.0.6/tools/lib/lvm_dir_cache.c	2002-04-26 09:52:49.000000000 +0200
+++ LVM/1.0.6/tools/lib/lvm_dir_cache.with.ignore.c	2003-08-20 04:05:46.000000000 +0200
@@ -45,6 +45,7 @@
  *    07/07/2001 - realloc now doubles the size of the cache [JT]
  *    17/12/2001 - make it find loop devices again [HM]
  *    01/22/2002 - fix broken whole device support [HM]
+ *    08/18/2003 - add ignore devices feature for lvm on drbd [jbanzhaf@ngi.de]
  *
  */
 
@@ -52,6 +53,14 @@
 #include <liblvm.h>
 
 
+#define IGNOREDFILE "/etc/lvmconf/ignored_devices"
+
+typedef struct ignored_dev {
+	char *name;
+	struct ignored_dev *next;
+} ignored_dev_t;
+
+
 static void _scan_partitions();
 static void _scan_devs(int);
 static int _add(char *directory, char *devname);
@@ -59,12 +68,17 @@
 static int _alloc();
 static int _is_present(dev_t rdev);
 static void _collapse_slashes(char *str);
-
+static void _read_ignored();
+static void _free_ignored(ignored_dev_t **node);
+static int _ignore(char *str);
 
 static dir_cache_t *_dir_cache;
 static int _cache_size;
 static int _array_size;
 
+static ignored_dev_t *_ignored_head = NULL;
+
+
 /* devices *not* showing up in /proc/partitions must be scanned anyway */
 static char *_noprocdir[] = {
 	LVM_DIR_PREFIX "loop",
@@ -99,11 +113,13 @@
 	}
 
 	if (!_dir_cache) {
+		_read_ignored();
 		_scan_partitions();
 		if(!_cache_size)
 			_scan_devs( TRUE);
 		else
 			_scan_devs( FALSE);
+		_free_ignored(&_ignored_head);
 	}
 
 	*dir_cache_ptr = _dir_cache;
@@ -255,6 +271,9 @@
 
 	debug_enter("lvm_add_dir_cache -- CALLED with %s\n", devpath);
 
+	if (_ignore(devpath))
+		goto out;
+
 	if (stat(devpath, &stat_b) == -1)
 		goto out;
 
@@ -348,3 +367,78 @@
 
 	*str = *ptr;
 }
+
+static void _add_ignored(char *line, ignored_dev_t ***list_tail)
+{
+	int len;
+	int add = 1;
+	ignored_dev_t *new_node;
+	
+	len = strlen(line);
+	if (line[len - 1] == '\n') {
+		line[len - 1] = '\0';
+		len--;
+	}
+	
+	debug_enter("_add_ignored -- CALLED with %s\n", line);
+	
+	new_node = (ignored_dev_t *)malloc(sizeof(ignored_dev_t));
+	if (new_node) {
+		new_node->name = strdup(line);
+		if (new_node->name) {
+			new_node->next = NULL;
+			**list_tail = new_node;
+			*list_tail = &new_node->next;
+		} else {
+			free(new_node);
+			add = 0;
+		}
+	} else {
+		add = 0;
+	}
+	
+	debug_leave("_add_ignored '%s' -- LEAVING with ret: %s\n", line, add ? "OK" : "ERROR");
+}
+
+static void _read_ignored()
+{
+	FILE	       *f;
+	char	        line[NAME_LEN];
+	ignored_dev_t **list_tail = &_ignored_head;
+	
+	if ( (f=fopen(IGNOREDFILE, "r")) != NULL ) {
+		while(fgets(line, sizeof(line), f)) {
+			if (line[0] != '\0' && line[0] != '\n' && line[0] != '#') {
+				_add_ignored(line, &list_tail);
+			}
+		}	
+		fclose(f);
+	}
+}
+
+static void _free_ignored(ignored_dev_t **curr)
+{
+	if( *curr )
+	{
+		_free_ignored(&(*curr)->next);
+		free((*curr)->name);
+		free(*curr);
+		*curr = NULL;
+	}	
+}
+
+static int _ignore(char *str)
+{
+	int rc = 0;
+	ignored_dev_t *curr = _ignored_head;
+
+	while (curr) {
+		if (!strcmp(str, curr->name)) {
+			rc = 1;
+			break;
+		}
+		curr = curr->next;
+	}
+	return rc;
+}
+

--Boundary-00=_Lq4Q/ZxMONyFQNz--
