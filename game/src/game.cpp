#include "raylib.h"
#include "raymath.h"

#include "imgui.h"
#include "imgui_internal.h"

#include "rlImGui.h"


void StyleImgui() 
{
	auto& style = ImGui::GetStyle();
	style.Colors[ImGuiCol_DockingEmptyBg] = ImVec4(0,0,0,0);

	auto& io = ImGui::GetIO();
	auto* fnt = io.Fonts->AddFontFromFileTTF("assets/fira_sans.ttf", 16.0);

	io.FontDefault = fnt;

	rlImGuiReloadFonts();
}

int main(int argc, char* argv[])
{
	SetConfigFlags(FLAG_MSAA_4X_HINT | FLAG_VSYNC_HINT | FLAG_WINDOW_RESIZABLE);
	InitWindow(1280, 720, "ImGui Bootstrap");
	SetTargetFPS(144);
	rlImGuiSetup(true);
	
	// Enable docking
	auto& io = ImGui::GetIO();
	io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;
	io.ConfigDockingTransparentPayload = true;
	
	StyleImgui();
	
	// Main game loop
	while (!WindowShouldClose())    // Detect window close button or ESC key
	{
		// Begin Block
		BeginDrawing();
		ClearBackground(BLACK);
		rlImGuiBegin();

		// Draw/imgui stuff here
		ImGui::SetNextWindowBgAlpha(0.0f); // This makes the window-level dock completely seethrough
		ImGui::DockSpaceOverViewport();

		ImGui::ShowDemoWindow();

		// End block
		rlImGuiEnd();
		EndDrawing();
	}

	rlImGuiShutdown(); 
	CloseWindow();

	return 0;
}